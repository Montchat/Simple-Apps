//
//  ViewController.swift
//  TickyTacToe
//
//  Created by Joe E. on 9/24/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

var grid = [[0,0,0],[0,0,0],[0,0,0]]
var winCondition = false
var isPlayerOneTurn = true

var playerOneScore = 0
var playerTwoScore = 0
var stalemates = 0

let winnerLabel = UILabel(frame: CGRect(x: 0, y: 500, width: 800, height: 100))

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.hidden = true
        
        for (r,row) in grid.enumerate() {
            for (c, _) in row.enumerate() {
                let x = r * 110
                let y = c * 110
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: 100, height: 100))
                button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)

                button.backgroundColor = UIColor.yellowColor()
                view.addSubview(button)
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonPressed(button: TTTButton) {
        if button.player == 0 {
            button.player = isPlayerOneTurn ? 1 : 2
        }
        grid[button.row][button.col] = isPlayerOneTurn ? 1 : 2
        isPlayerOneTurn = !isPlayerOneTurn
        
        checkForWinCondition()
        
    }

}

func checkForWinCondition() {
    if winCondition == false {
        let possibilities = [
            ((0,0),(1,1),(2,2))
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
        
    } else {
        winnerLabel.hidden = false
        winnerLabel.text = "We have a winner!"
    }

}