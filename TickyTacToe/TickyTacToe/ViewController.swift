//
//  ViewController.swift
//  TickyTacToe
//
//  Created by Joe E. on 9/24/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

class ResetGameBoardButton: UIButton {
    var isResetButton = true
}

class ResetScoresButton: UIButton {
    var isResetButton = true
    
}

class ViewController: UIViewController {
    var grid = [[0,0,0],[0,0,0],[0,0,0]]
    var winCondition = false
    var isPlayerOneTurn = true
    var turn = 0
    var stalemate = false
    
    var playerOneScore = 0
    var playerTwoScore = 0
    var stalemates = 0
    
    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 200, height: 50))
    let playersScoresLabel = UILabel(frame:CGRect(x: 0, y: 50, width: 200, height: 50))
    let resetScoresButton = ResetScoresButton (frame: CGRect(x: 0, y: 150, width: 200, height: 50))
    let resetGameBoardButton = ResetGameBoardButton(frame: CGRect(x: 0, y: 525, width: 200, height: 50))

    func resetScores(button: ResetScoresButton) {
        playerOneScore = 0
        playerTwoScore = 0
        stalemates = 0
        turn = 0
        playersScoresLabel.text = "p1: \(playerOneScore) p2: \(playerTwoScore) s: \(stalemates)"
        
        grid = [[0,0,0],[0,0,0],[0,0,0]]
        winCondition = false
        isPlayerOneTurn = true
        turn = 0
        resetGameBoardButton.setTitle("End Game", forState: UIControlState.Normal)
        gameStatusLabel.text = "Player1 Turn"
        gameStatusLabel.backgroundColor = UIColor.redColor()
        
        for subview in view.subviews {
            if let button = subview as? TTTButton {
                button.player = 0
                
            }
            
        }
        
    }
    
    func resetGameBoard(button: ResetGameBoardButton) {
        grid = [[0,0,0],[0,0,0],[0,0,0]]
        winCondition = false
        isPlayerOneTurn = true
        turn = 0
        resetGameBoardButton.setTitle("End Game", forState: UIControlState.Normal)
        gameStatusLabel.text = "Player1 Turn"
        gameStatusLabel.backgroundColor = UIColor.redColor()

        for subview in view.subviews {
        if let button = subview as? TTTButton {
            button.player = 0
            
            }
            
        }
        
    }
    
    func buttonPressed(button: TTTButton) {
        if button.player == 0 && winCondition == false  {
            turn++
            
            button.player = isPlayerOneTurn ? 1 : 2
            
            if isPlayerOneTurn == true {
                gameStatusLabel.backgroundColor = UIColor.blueColor()
                gameStatusLabel.text = "Player2 Turn"
            } else {
                gameStatusLabel.text = "Player1 Turn"
                gameStatusLabel.backgroundColor = UIColor.redColor()
                
            }
            
            grid[button.row][button.col] = isPlayerOneTurn ? 1 : 2
            isPlayerOneTurn = !isPlayerOneTurn
            checkForWinCondition()
            
        }
        
    }
    
    func checkForWinCondition() {
        if winCondition == false {
            print("Turn: \(turn)")
            let possibilities = [
                ((0,0),(0,1),(0,2)),
                ((1,0),(1,1),(1,2)),
                ((2,0),(2,1),(2,2)),
                ((0,0),(1,0),(2,0)),
                ((0,1),(1,1),(2,1)),
                ((1,2),(1,2),(2,2)),
                ((0,0),(1,1),(2,2)),
                ((2,0),(1,1),(0,2))
            ]
            
            for possibility in possibilities {
                let (p1,p2,p3) = possibility
                
                let value1 = grid[p1.0][p1.1]
                let value2 = grid[p2.0][p2.1]
                let value3 = grid[p3.0][p3.1]
                
                if value1 == value2 && value2 == value3 && value1 != 0 {
                    
                    winCondition = true
                    gameStatusLabel.text = "We have a winner!"
                    
                    if !isPlayerOneTurn {
                        gameStatusLabel.text = "Player1 wins!"
                        gameStatusLabel.backgroundColor = UIColor.redColor()
                        playerOneScore++
                        playersScoresLabel.text = "p1: \(playerOneScore) p2: \(playerTwoScore) s: \(stalemates)"
                        
                    } else {
                        gameStatusLabel.text = "Player2 wins"
                        gameStatusLabel.backgroundColor = UIColor.blueColor()
                        playerTwoScore++
                        playersScoresLabel.text = "p1: \(playerOneScore) p2: \(playerTwoScore) s: \(stalemates)"
                        
                    }
                    
                    resetGameBoardButton.setTitle("Play again", forState: .Normal)
                    
                } else if turn == 9 {
                    stalemate = true
                    stalemates++
                    playersScoresLabel.text = "p1: \(playerOneScore) p2: \(playerTwoScore) s: \(stalemates)"
                    gameStatusLabel.text = "Stalemate!"
                        
                }

            }
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStatusLabel.text = "Player1 Turn"
        gameStatusLabel.textAlignment = .Center
        gameStatusLabel.center.x = view.center.x
        gameStatusLabel.textColor = UIColor.grayColor()
        gameStatusLabel.backgroundColor = UIColor.redColor()
        
        view.addSubview(gameStatusLabel)
        
        playersScoresLabel.text = "p1: \(playerOneScore) p2: \(playerTwoScore) s: \(stalemates)"
        playersScoresLabel.textAlignment = .Center
        playersScoresLabel.center.x = view.center.x
        
        view.addSubview(playersScoresLabel)
        
        resetGameBoardButton.setTitle("End Game", forState: UIControlState.Normal)
        resetGameBoardButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        resetGameBoardButton.titleLabel?.textAlignment = .Center
        resetGameBoardButton.center.x = view.center.x
        resetGameBoardButton.backgroundColor = UIColor.yellowColor()
        resetGameBoardButton.addTarget(self, action: "resetGameBoard:", forControlEvents: .TouchUpInside)
        
        view.addSubview(resetGameBoardButton)
        
        resetScoresButton.setTitle("Reset Scores", forState: UIControlState.Normal)
        resetScoresButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        resetScoresButton.titleLabel?.textAlignment = .Center
        resetScoresButton.center.x = view.center.x
        resetScoresButton.backgroundColor = UIColor.yellowColor()
        resetScoresButton.addTarget(self, action: "resetScores:", forControlEvents: .TouchUpInside)
        
        view.addSubview(resetScoresButton)
        
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        
        let buttonHW = 100
        let buttonSpacing = 4
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        for (r,row) in grid.enumerate() {
            for (c, _) in row.enumerate() {
                let x = c * (buttonHW + buttonSpacing) + leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: buttonHW, height: buttonHW))
                button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
                
                button.row = r
                button.col = c
                
                button.backgroundColor = UIColor.yellowColor()
                button.setTitle("", forState: .Normal)
                button.setTitleColor(UIColor.grayColor(), forState: .Normal)
                
                view.addSubview(button)
                
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

