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
            case 1: setImage(UIImage(named: "Yellow"), forState: .Normal)
            case 2: setImage(UIImage(named: "Blue"), forState: .Normal)
            default: setImage(UIImage(named: "White"), forState: .Normal)
                
            }
            
        }
        
    }

}
