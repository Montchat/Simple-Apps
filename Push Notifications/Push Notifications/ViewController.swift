//
//  ViewController.swift
//  Push Notifications
//
//  Created by Joe E. on 12/15/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    //Properties
    //MARK: @IBOutlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    //Constraints
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    //MARK: @IBActions
    @IBAction func sendButtonPressed(sender: AnyObject) {
    
        guard let text = textField.text else { return }
        let installation = PFInstallation.currentInstallation()
        installation.saveInBackground()
        
        guard let query = PFInstallation.query() else { return }
        query.whereKey("deviceType", equalTo: "ios")
        
        PFPush.sendPushMessageToQueryInBackground(query, withMessage: text) { (bool, error) -> Void in
            if error != nil {
                
            } else {
                print(error)
                
            }
            
        }
        
        //changing ui properties
        textField.resignFirstResponder()
        changeConstraintTo(bottomConstraint, amount: 155, duration: 1)
        textField.text = nil
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //makes the button rounder
        sendButton.layer.cornerRadius = sendButton.frame.width / 2
        textField.delegate = self 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

extension ViewController : UITextFieldDelegate {
    
    //for getting the textField and button to move out of the way when we touch the textField
    
    func textFieldDidBeginEditing(textField: UITextField) {
        changeConstraintTo(self.bottomConstraint, amount: 155 * 2, duration: 1)
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        changeConstraintTo(self.bottomConstraint, amount: 155, duration: 1)
        textField.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        changeConstraintTo(bottomConstraint, amount: 155, duration: 1)
        textField.resignFirstResponder()
        
        return true
    
    }
    
}

extension ViewController {
    func changeConstraintTo(constraint:NSLayoutConstraint, amount: CGFloat, duration: Double) {
        UIView.animateWithDuration(duration) { () -> Void in
            constraint.constant = amount
            
        }
        
    }
    
}