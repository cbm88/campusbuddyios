//
//  GPAViewController.swift
//  CampusBuddy
//
//  Created by Mark Rustad on 11/25/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

import UIKit

class GPAViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextViewDelegate {
    
    
    @IBOutlet var gradeA: UITextField!
    @IBOutlet var gradeB: UITextField!
    @IBOutlet var gradeC: UITextField!
    
    @IBOutlet var gradeD: UITextField!
    @IBOutlet var gradeE: UITextField!
    @IBOutlet var gradeF: UITextField!
    
    @IBOutlet var creditA: UITextField!
    @IBOutlet var creditB: UITextField!
    @IBOutlet var creditC: UITextField!
    
    @IBOutlet var creditD: UITextField!
    @IBOutlet var creditE: UITextField!
    @IBOutlet var creditF: UITextField!
    
    @IBOutlet var answerField: UITextView!
    
    @IBOutlet var picker: UIPickerView!
    let pickerData = ["GPA Key", "A: 4.0", "A-: 3.7", "B+: 3.3", "B: 3.0", "B-: 2.7", "C+: 2.3", "C: 2.0", "C-: 1.7", "D+:1.3", "D: 1.0", "D-: 0.7", "F: 0.0"];
    
    @IBOutlet var gradeButton: UIButton!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewShouldReturn(textView: UITextView) -> Bool{
        
        textView.resignFirstResponder();
        return true;
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradeA.delegate=self;
        gradeB.delegate=self;
        gradeC.delegate=self;
        gradeD.delegate=self;
        gradeE.delegate=self;
        gradeF.delegate=self;
        creditA.delegate=self;
        creditB.delegate=self;
        creditC.delegate=self;
        creditD.delegate=self;
        creditE.delegate=self;
        creditF.delegate=self;
        answerField.delegate=self;
        
        self.gradeButton.layer.borderColor = UIColor.cyanColor().CGColor;
        self.gradeButton.layer.borderWidth = 2;
        
        self.picker.layer.backgroundColor = UIColor.whiteColor().CGColor;
        
        

    }
    
    @IBAction func calculate(sender: UIButton) {
        let gradepoint = Grade(gradeOne: 0.0, gradeTwo: 0.0, gradeThree: 0.0, gradeFour: 0.0, gradeFive: 0.0, gradeSix: 0.0, creditOne: 0.0, creditTwo: 0.0, creditThree: 0.0, creditFour: 0.0, creditFive: 0.0, creditSix: 0.0);
        
        let gradeOne = Double(gradeA.text!);
        gradepoint.gradeOne = gradeOne!;
        gradeA.resignFirstResponder();
        
        let gradeTwo = Double(gradeB.text!);
        gradepoint.gradeTwo = gradeTwo!;
        gradeB.resignFirstResponder();
        
        let gradeThree = Double(gradeC.text!);
        gradepoint.gradeThree = gradeThree!;
        gradeC.resignFirstResponder();
        
        let gradeFour = Double(gradeD.text!);
        gradepoint.gradeFour = gradeFour!;
        gradeD.resignFirstResponder();
        
        let gradeFive = Double(gradeE.text!);
        gradepoint.gradeFive = gradeFive!;
        gradeE.resignFirstResponder();
        
        let gradeSix = Double(gradeF.text!);
        gradepoint.gradeSix = gradeSix!;
        gradeF.resignFirstResponder();
        
        
        let creditOne = Double(creditA.text!);
        gradepoint.creditOne = creditOne!;
        creditA.resignFirstResponder();
        
        let creditTwo = Double(creditB.text!);
        gradepoint.creditTwo = creditTwo!;
        creditB.resignFirstResponder();
        
        let creditThree = Double(creditC.text!);
        gradepoint.creditThree = creditThree!;
        creditC.resignFirstResponder()
        
        let creditFour = Double(creditD.text!);
        gradepoint.creditFour = creditFour!;
        creditD.resignFirstResponder();
        
        let creditFive = Double(creditE.text!);
        gradepoint.creditFive = creditFive!;
        creditE.resignFirstResponder();
        
        let creditSix = Double(creditF.text!);
        gradepoint.creditSix = creditSix!;
        creditF.resignFirstResponder();
        
        
        answerField.text = NSString(format: "Your Semester GPA Is: %.2f", gradepoint.getGPA()) as String;
        
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
