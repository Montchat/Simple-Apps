//
//  TTTButton.swift
//  TickyTacToe
//
//  Created by Joe E. on 9/24/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

class TTTButton: UIButton {
    var row = 0
    var col = 0
    
    var player = 0 {
        didSet {
            switch player {
            case 1: backgroundColor = UIColor.redColor()
            case 2: backgroundColor = UIColor.blueColor()
            default: backgroundColor = UIColor.yellowColor()
                
            }
            
        }
        
    }

}
