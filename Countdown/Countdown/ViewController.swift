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
    var timer = NSTimer()
    
    @IBOutlet weak var countDownLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        countDownLabel.text = String(COUNT)
        timer = NSTimer.scheduledTimerWithTimeInterval(TIME_INTERVAL, target: self, selector: Selector(SELECTOR), userInfo: nil, repeats: true)

    }
    
    func countdown() {
        
        if COUNT > 0 {
            print(COUNT)
            COUNT--
            countDownLabel.text = String(COUNT)
            
        } else if COUNT == 0 {
            timer.invalidate()
            
        }
        
    }

}