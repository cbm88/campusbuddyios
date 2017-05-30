//
//  Grade.swift
//  CampusBuddy
//
//  Created by Mark Rustad on 11/25/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

import UIKit

class Grade: NSObject {
    
    var gradeOne: Double = 0.0;
    
    var gradeTwo: Double = 0.0;
    
    var gradeThree: Double = 0.0;
    
    var gradeFour: Double = 0.0;
    
    var gradeFive: Double = 0.0;
    
    var gradeSix: Double = 0.0;
    
    var creditOne: Double;
    
    var creditTwo: Double;
    
    var creditThree: Double;
    
    var creditFour: Double;
    
    var creditFive: Double;
    
    var creditSix: Double;
  
    
    init(gradeOne: Double, gradeTwo: Double, gradeThree: Double, gradeFour: Double, gradeFive: Double, gradeSix: Double, creditOne: Double, creditTwo: Double, creditThree: Double, creditFour: Double, creditFive: Double, creditSix: Double) {
        
        self.gradeOne = gradeOne;
        self.gradeTwo = gradeTwo;
        self.gradeThree = gradeThree;
        self.gradeFour = gradeFour;
        self.gradeFive = gradeFive;
        self.gradeSix = gradeSix;
        self.creditOne = creditOne;
        self.creditTwo = creditTwo;
        self.creditThree = creditThree;
        self.creditFour = creditFour;
        self.creditFive = creditFive;
        self.creditSix = creditSix;
    
    }
    
    func getGPA()->Double{
        
        let totalGrades = ((gradeOne*creditOne)+(gradeTwo*creditTwo)+(gradeThree * gradeThree)+(gradeFour*creditFour)+(gradeFive*creditFive)+(gradeSix*creditSix));
        
        let totalCredits = (creditOne+creditTwo+creditThree+creditFour+creditFive+creditSix);
        
        let result = totalGrades/totalCredits;
        
        return result;
        
        
    }
    

}
