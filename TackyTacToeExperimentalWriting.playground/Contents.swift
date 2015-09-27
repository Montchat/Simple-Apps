//: Playground - noun: a place where people can play

import UIKit

var grid = [[0,0,0],[0,0,0],[0,0,0]]
var winCondition = false
var playerOneScore = 0
var playerTwoScore = 0
var stalemates = 0
var isPlayerOneTurn = true


class ViewController: UIViewController {
    override func viewDidLoad() {
        
        for (r,row) in grid.enumerate() {
            for (c, col) in row.enumerate() {
                let x = r * 110
                let y = c * 110
                
                let button = TTTButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                button.backgroundColor = UIColor.yellowColor()
                button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
                
                view.addSubview(button)
                
            }
        }

    }

}

class TTTButton:UIButton {
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

func buttonPressed(button:TTTButton) {
    if button.player == 0 {
        button.player = isPlayerOneTurn ? 1 : 2
    }
    
    isPlayerOneTurn = !isPlayerOneTurn
    grid[button.row][button.col] = isPlayerOneTurn ? 1 : 2
    
    checkWinCondition()
    
}

func checkWinCondition() {
    let possibilities = [
    ((0,0), (1,1), (2,2))
        
    ]

    for possibility in possibilities {
        
        let (p1,p2,p3) = possibility
        
        let value1 = grid[p1.0][p1.1]
        let value2 = grid[p2.0][p2.1]
        let value3 = grid[p3.0][p3.1]
        
        if value1 == value2 && value2 == value3 && value1 != 0 {
            winCondition = true
        } else {
            winCondition = false
        }
        
    }

}
