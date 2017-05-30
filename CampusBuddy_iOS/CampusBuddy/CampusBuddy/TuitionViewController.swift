//
//  TuitionViewController.swift
//  CampusBuddy
//
//  Created by Mark Rustad on 11/26/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

import UIKit

class TuitionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var picker: UIDatePicker!
    
    @IBOutlet var tuitionField: UITextField!
    
    @IBOutlet var paidSwitch: UISwitch!
    
    @IBOutlet var yesLabel: UILabel!
    
    @IBOutlet var alertButton: UIButton!
    
    @IBOutlet var tuitionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = NSUserDefaults.standardUserDefaults();
        tuitionField.text = defaults.stringForKey("string");
        self.paidSwitch.on = (defaults.boolForKey("paidKey"));
        yesLabel.text = defaults.stringForKey("paidString");
        
        tuitionField.delegate = self;
        
        self.picker.layer.backgroundColor = UIColor.whiteColor().CGColor;
        
        self.alertButton.layer.borderColor = UIColor.redColor().CGColor;
        self.alertButton.layer.borderWidth = 2;
        
        self.tuitionButton.layer.borderColor = UIColor.blueColor().CGColor;
        self.tuitionButton.layer.borderWidth = 2;
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

    @IBAction func setAlert(sender: UIButton){
        let notification = UILocalNotification();
        notification.fireDate = picker.date;
        notification.alertBody = "Your Tuition Payment Is Due Today!";
        notification.timeZone = NSTimeZone.defaultTimeZone();
        notification.applicationIconBadgeNumber = 1;
        UIApplication.sharedApplication().scheduleLocalNotification(notification);
        
    }

    
    @IBAction func save(sender: UIButton) {
        
        let defaults = NSUserDefaults.standardUserDefaults();
        let tuition = tuitionField.text!;
        defaults.setObject(tuition, forKey: "string");
        tuitionField.resignFirstResponder();
        defaults.synchronize();
        
    }

    @IBAction func paidSwitchChanged(sender: UISwitch) {
        
        let defaults = NSUserDefaults.standardUserDefaults();
        if (paidSwitch.on==true){
            defaults.setBool(paidSwitch.on, forKey: "paidKey");
            let paidText = "YES";
            yesLabel.text = paidText;
            defaults.setObject(paidText, forKey: "paidString");
        }
        else if (paidSwitch.on==false){
            defaults.setBool(paidSwitch.on, forKey: "paidKey");
            yesLabel.hidden = true;
        }
        defaults.synchronize();
        
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
