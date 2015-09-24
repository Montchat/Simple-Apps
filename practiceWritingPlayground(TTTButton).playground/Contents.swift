//: Playground - noun: a place where people can play

import UIKit

var isPlayerOneTurn = true
var playerOneScore = 0
var playerTwoScore = 0
var stalemates = 0

class ViewController: UIViewController {
    var button1 = TTTButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    override func viewDidLoad() {
        button1.col = 0
        button1.row = 0
        button1.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
        view.addSubview(button1)
        
    }

}

class TTTButton: UIButton {
    var col = 0
    var row = 0
    var player = 0 {
        didSet {
            switch player {
            case 1: backgroundColor = UIColor.redColor()
            case 2: backgroundColor = UIColor.blueColor()
            default: backgroundColor = UIColor.whiteColor()
                
            }
            
        }
        
    }

}

func buttonPressed(button:TTTButton) {
    if button.player == 0 {
        button.player = isPlayerOneTurn ? 1 : 2
    }
    isPlayerOneTurn = !isPlayerOneTurn
    
}