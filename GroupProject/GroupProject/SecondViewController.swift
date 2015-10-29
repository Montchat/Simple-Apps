//
//  SecondViewController.swift
//  GroupProject
//
//  Created by Joe E. on 10/29/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    //MARK: - @IBOutlet
    @IBOutlet weak var wordsLabel: UILabel!

    //MARK: - Properties
    var colorArray: [UIColor]?
    
    
    //MARK: - @IBActions
    @IBAction func buttonPressed(sender: AnyObject) {
        if let button = sender as? TheButton {
            if let backgroundColor = button.backgroundColor {
                self.view.backgroundColor = backgroundColor
                    colorArray?.append(backgroundColor)
                WordsTableViewController.callTableViewController()
                wordsLabel.text = WordsTableViewController.callTableViewController().wordArray[button.tag]
                wordsLabel.textColor = button.titleLabel?.textColor
                
            }
            
        }
        
    }
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - didReceiveMemoryWarning()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}