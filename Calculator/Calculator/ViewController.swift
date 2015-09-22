//
//  ViewController.swift
//  Calculator
//
//  Created by Joe E. on 9/21/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

var number1 = ""
var number2 = ""
var operation: OperationType?

var num1 = Double(number1)
var num2 = Double(number2)

func numberIsDivisible(number: Double) -> Bool {
    if number % 1 == 0 {
        return true
    } else {
        return false
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var operationDisplay: UILabel!
    
    @IBAction func numberPressed(button: UIButton) {
        let num = button.titleLabel!.text!
        
        if operation == nil {
            number1 += num
            displayLabel.text = number1
        } else {
            number2 += num
            displayLabel.text = number2
            
        }
        
    }
    
    @IBAction func clear() {
        number1 = ""
        number2 = ""
        operation = nil
        displayLabel.text = "0"
        operationDisplay.text = ""
        
    }
    
    @IBAction func changeSign() {
        if operation == nil {
            num1 = num1! * -1
            if numberIsDivisible(num1!) == true {
                displayLabel.text = "\(Int(num1!))"
                
            } else {
                displayLabel.text = "\(num1!))"
                
            }

        } else {
            num2 = num2! * -1
            if numberIsDivisible(num2!) == true {
                displayLabel.text = "\(Int(num2!))"
                
            } else {
                displayLabel.text = "\(num2!))"
                
            }
            
        }
        
    }
    
    @IBAction func setOperation(button:UIButton) {
        let opSign = button.titleLabel!.text!
        operation = OperationType(rawValue: opSign) //this is a function that creates a new operation type with a chosen value based on the string that we are passing in
        operationDisplay.text = opSign
    
    }
    
    @IBAction func runEquation() {

        let total = calculateNumbers(n1: num1!, n2: num2!, operation: operation!)
        
        if numberIsDivisible(total) {
            displayLabel.text = "\(Int(total))"
        } else {
            displayLabel.text = "\(total)"
            
        }
        
        number1 = displayLabel.text!
        operationDisplay.text = ""
        
    }
    
}