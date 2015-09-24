//
//  ViewController.swift
//  TicTacToe
//
//  Created by Joe E. on 9/24/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creating Buttons
        let button1 = TTTButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button1.backgroundColor = UIColor.yellowColor()
        button1.row = 0
        button1.col = 0
        button1.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
        view.addSubview(button1)
        
        let button2 = TTTButton(frame: CGRect(x: 20, y: 0, width: 100, height: 100))
        button2.backgroundColor = UIColor.yellowColor()
        button2.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
        button1.row = 0
        button1.col = 1
        view.addSubview(button2)
        
        let button3 = TTTButton(frame: CGRect(x: 40, y: 0, width: 100, height: 100))
        button3.backgroundColor = UIColor.yellowColor()
        button3.tag = 2
        button3.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
        button1.row = 0
        button1.col = 2
        view.addSubview(button3)
        
        let button4 = TTTButton(frame: CGRect(x: 0, y: 20, width: 100, height: 100))
        button4.backgroundColor = UIColor.yellowColor()
        button4.tag = 3
        button4.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
        button1.row = 1
        button1.col = 0
        view.addSubview(button4)

        let button5 = TTTButton(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        button5.backgroundColor = UIColor.yellowColor()
        button5.tag = 4
        button5.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
        button1.row = 1
        button1.col = 1
        view.addSubview(button5)
        
        let button6 = TTTButton(frame: CGRect(x: 40, y: 20, width: 100, height: 100))
        button6.backgroundColor = UIColor.yellowColor()
        button6.tag = 5
        button6.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
        button1.row = 1
        button1.col = 2
        view.addSubview(button6)
        
        let button7 = TTTButton(frame: CGRect(x: 0, y: 40, width: 100, height: 100))
        button7.backgroundColor = UIColor.yellowColor()
        button7.tag = 6
        button7.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
        button1.row = 2
        button1.col = 0
        view.addSubview(button7)
        
        let button8 = TTTButton(frame: CGRect(x: 20, y: 40, width: 100, height: 100))
        button8.backgroundColor = UIColor.yellowColor()
        button8.tag = 7
        button8.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
        button1.row = 2
        button1.col = 1
        view.addSubview(button8)
        
        let button9 = TTTButton(frame: CGRect(x: 40, y: 40, width: 100, height: 100))
        button9.backgroundColor = UIColor.yellowColor()
        button9.tag = 8
        button9.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
        button1.row = 2
        button1.col = 2
        view.addSubview(button9)

    }
    
    func spacePressed(button: TTTButton) {
        print("button works")
    }
    
    class TTTButton: UIButton {
        var row = 0
        var col = 0
        
        var player: Int = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

