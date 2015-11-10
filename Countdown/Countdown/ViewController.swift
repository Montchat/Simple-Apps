//
//  ViewController.swift
//  Countdown
//
//  Created by Joe E. on 11/9/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

private let TIME_INTERVAL:Double = 1
private var COUNT = 5

private let SELECTOR = "countdown"

class ViewController: UIViewController {
    

    @IBAction func buttonPressed(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var countDownLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        countDownLabel.text = String(COUNT)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    func startTimer(var theTime: NSTimer) {
        theTime = NSTimer(timeInterval: TIME_INTERVAL, target: self, selector: Selector(SELECTOR), userInfo: nil, repeats: true)

        
    }
    
    func countdown() {
        print("it worked")
        
        if COUNT > 0 {
            print(COUNT)
            COUNT - 1
            countDownLabel.text = String(COUNT)
            
        } else if COUNT == 0 {
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

