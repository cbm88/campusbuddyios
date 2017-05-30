//
//  ViewController.swift
//  CampusBuddy
//
//  Created by Mark Rustad on 11/25/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gpaButton: UIButton!
    
    @IBOutlet var tuitionButton: UIButton!
    
    @IBOutlet var dormButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gpaButton.layer.borderColor = UIColor.grayColor().CGColor;
        gpaButton.layer.borderWidth = 3;
        
        tuitionButton.layer.borderColor = UIColor.grayColor().CGColor;
        tuitionButton.layer.borderWidth = 3;
        
        dormButton.layer.borderColor = UIColor.grayColor().CGColor;
        dormButton.layer.borderWidth = 3;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

