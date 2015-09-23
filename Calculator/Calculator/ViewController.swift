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
            print("Number1:\(number1)")
            print("Number2:\(number2)")
            
        } else {
            
            number2 += num
            displayLabel.text = number2
            print("Number1:\(number1)")
            print("Number2:\(number2)")
            
        }
        
    }
    
    @IBAction func clear() {
        number1 = ""
        number2 = ""
        operation = nil
        displayLabel.text = "0"
        operationDisplay.text = ""
        
    }
    
    
    @IBAction func setOperation(button:UIButton) {
        let opSign = button.titleLabel!.text!
        operation = OperationType(rawValue: opSign)
        number2 = ""
        operationDisplay.text = opSign
    
    }
    
    @IBAction func runEquation() {
        var num1 = Double(number1)
        var num2 = Double(number2)
        let total = calculateNumbers(n1: num1!, n2: num2!, operation: operation!)
        
        if numberIsDivisible(total) {
            displayLabel.text = "\(Int(total))"
        } else {
            displayLabel.text = "\(total)"
            
        }
        
        num1 = total
        
        number1 = displayLabel.text!
        print(operation)
        print("Number1:\(number1)")
        print("Number2:\(number2)")
        print("Num1:\(num1)")
        print("Num2:\(num2)")
    }
    
    @IBAction func changeSign() {
        if operation == nil {
            
            var num1 = Double(number1)
            num1 = num1! * -1
            if numberIsDivisible(num1!) == true {
                displayLabel.text = "\(Int(num1!))"
            } else {
                displayLabel.text = "\(num1!))"
            }
            
        } else {
            var num2 = Double(number2)
            num2 = num2! * -1
            if numberIsDivisible(num2!) == true {
                displayLabel.text = "\(Int(num2!))"
            } else {
                displayLabel.text = "\(num2!))"
                
            }
            
        }
        
    }
    
    @IBAction func addDecimal() {
        if operation == nil {
            
            print("add decimal to first number")
            
        } else {
            print("add decimal to second number")
            
        }
        
    }

    
}