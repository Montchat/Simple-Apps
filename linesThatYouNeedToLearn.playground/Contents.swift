//: Playground - noun: a place where people can play

import UIKit
var isPlayerOneTurn = true
var button:UIButton = UIButton()

class TTTButton:UIButton {
    var col = 0
    var row = 0
    
    var player = 0 {
        didSet {
            switch player {
            case 1: backgroundColor = UIColor.redColor()
            case 2:backgroundColor = UIColor.blueColor()
            default:backgroundColor = UIColor.yellowColor()
                
            }
            
        }
        
    }
    
}

//need to know how to change the boolean
func spacePressed(button:TTTButton) {
    if button.player == 0 {
        button.player = isPlayerOneTurn ? 1 : 2
    }
    
    isPlayerOneTurn = !isPlayerOneTurn
    
}
/////


class JJJButton: UIButton {
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

func buttonJammed(button: JJJButton) {
    if button.player == 0 {
        button.player = isPlayerOneTurn ? 1 : 2
    }

    isPlayerOneTurn = !isPlayerOneTurn
    
}


class BigRedButton: UIButton {
    var col = 0
    var row = 0
    
    var player = 0 {
        didSet {
            switch player {
            case 1:backgroundColor = UIColor.redColor()
            case 2:backgroundColor = UIColor.redColor()
            default:backgroundColor = UIColor.redColor()
            }
            
        }
        
    }
    
}

func pressTheRedButton(button:BigRedButton) {
    if button.player == 0 {
        button.player = isPlayerOneTurn ? 1 : 2
    }
    
    isPlayerOneTurn = !isPlayerOneTurn
}



