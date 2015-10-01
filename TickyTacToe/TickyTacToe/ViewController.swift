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
    let screenHeight = Int(UIScreen.mainScreen().bounds.height)
    let screenWidth = Int(UIScreen.mainScreen().bounds.width)
    
    var grid = [[0,0,0],[0,0,0],[0,0,0]]
    var winCondition = false
    var isPlayerOneTurn = true
    var turn = 0
    var stalemate = false
    
    var playerOneScore = 0
    var playerTwoScore = 0
    var stalemates = 0
    
    let playerOneScoreImage: UIImageView = UIImageView(image: UIImage(named: "Yellow"))
    let playerTwoScoreImage: UIImageView = UIImageView(image: UIImage(named: "Blue"))

    let playerOneScoreText: UILabel = UILabel()
    let playerTwoScoreText: UILabel = UILabel()
    let stalematesImage: UIImageView = UIImageView(image: UIImage(named: "Stalemates"))
    let stalematesText: UILabel = UILabel()
    
    let gameStatusLabel = UIImageView(image: UIImage(named: "Yellow"))
    let resetScoresButton = ResetScoresButton (frame: CGRect(x: 0, y: 150, width: 200, height: 50))
    let resetGameBoardButton = ResetGameBoardButton(frame: CGRect(x: 0, y: 525, width: 200, height: 50))
    
    let winnerMessage = UIImageView!()
    let resetButtonImage: UIImage? = UIImage(named: "RestartButton")

    func resetScores(button: ResetScoresButton) {
        playerOneScore = 0
        playerTwoScore = 0
        stalemates = 0
        turn = 0
        playerOneScoreText.text = "\(playerOneScore)"
        playerTwoScoreText.text = "\(playerTwoScore)"
        
        grid = [[0,0,0],[0,0,0],[0,0,0]]
        winCondition = false
        isPlayerOneTurn = true
        turn = 0
        gameStatusLabel.image = UIImage(named: "Player1")
        
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
        gameStatusLabel.image = UIImage(named:"Yellow")

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
                gameStatusLabel.image = UIImage(named: "Blue")

            } else {
                gameStatusLabel.image = UIImage(named: "Yellow")
                
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
//                    winnerMessage.hidden = false
                    
                    if !isPlayerOneTurn {
                        gameStatusLabel.image = UIImage(named: "Yellow")
                        playerOneScore++
                        playerOneScoreText.text = "\(playerOneScore)"
                        
                    } else {
                        gameStatusLabel.image = UIImage(named: "Blue")
                        playerTwoScore++
                        playerTwoScoreText.text = "\(playerTwoScore)"
                        
                    }
                    
                    resetGameBoardButton.setTitle("Play again", forState: .Normal)
                    
                } else if turn == 9 {
                    stalemate = true
                    stalemates++
                    stalematesText.text = "\(stalemates)"
                    
                }

            }
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "RedBackground.png")!)
        
        gameStatusLabel.frame = CGRect(x: view.center.x, y: view.center.y - 300, width: 75, height: 75)
        gameStatusLabel.center.x = view.center.x
        gameStatusLabel.center.y = view.center.y - 300
        
        view.addSubview(gameStatusLabel)
        
        playerOneScoreImage.frame = CGRect(x: view.center.x, y: view.center.y - 300, width: 75, height: 75)
        playerOneScoreImage.center.x = view.center.x - 150
        playerOneScoreImage.center.y = view.center.y - 300
        
        view.addSubview(playerOneScoreImage)
        
        playerTwoScoreImage.frame = CGRect(x: view.center.x + 20, y: view.center.y - 300, width: 75, height: 75)
        playerTwoScoreImage.center.x = view.center.x + 150
        playerTwoScoreImage.center.y = view.center.y - 300
        
        view.addSubview(playerTwoScoreImage)
        
        stalematesImage.frame = CGRect(x: view.center.x + 20, y: view.center.y - 300, width: 25, height: 25)
        stalematesImage.center.x = view.center.x - 150
        stalematesImage.center.y = view.center.y - 150
        
        view.addSubview(stalematesImage)
        
        playerOneScoreText.frame = CGRect(x: view.center.x, y: view.center.y - 300, width: 75, height: 75)
        playerOneScoreText.center.x = view.center.x - 150
        playerOneScoreText.center.y = view.center.y - 300
        playerOneScoreText.text = "\(playerOneScore)"
        playerOneScoreText.textAlignment = .Center
        playerOneScoreText.font = UIFont(name: "HeadlineA", size: 48)
        playerOneScoreText.textColor = UIColor.grayColor()
        
        view.addSubview(playerOneScoreText)
        
        playerTwoScoreText.frame = CGRect(x: view.center.x, y: view.center.y - 300, width: 75, height: 75)
        playerTwoScoreText.center.x = view.center.x + 150
        playerTwoScoreText.center.y = view.center.y - 300
        playerTwoScoreText.text = "\(playerTwoScore)"
        playerTwoScoreText.textAlignment = .Center
        playerTwoScoreText.font = UIFont(name: "HeadlineA", size: 48)
        playerTwoScoreText.textColor = UIColor.grayColor()
        
        view.addSubview(playerTwoScoreText)
        
        stalematesText.frame = CGRect(x: view.center.x + 20, y: view.center.y - 300, width: 25, height: 25)
        stalematesText.center.x = view.center.x - 150
        stalematesText.center.y = view.center.y - 150
        stalematesText.text = ""
        stalematesText.textAlignment = .Center
        stalematesText.font = UIFont(name: "HeadlineA", size: 24)
        stalematesText.textColor = UIColor.whiteColor()
        
        view.addSubview(stalematesText)
        
        resetGameBoardButton.setTitle("End Game", forState: UIControlState.Normal)
        resetGameBoardButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        resetGameBoardButton.setImage(resetButtonImage, forState: .Normal)
        resetGameBoardButton.titleLabel?.textAlignment = .Center
        resetGameBoardButton.center.x = view.center.x
//        resetGameBoardButton.backgroundColor = UIColor.yellowColor()
        resetGameBoardButton.addTarget(self, action: "resetGameBoard:", forControlEvents: .TouchUpInside)
        
        view.addSubview(resetGameBoardButton)
        
        resetScoresButton.setTitle("Reset Scores", forState: UIControlState.Normal)
        resetScoresButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        resetScoresButton.setImage(resetButtonImage, forState: .Normal)
        resetScoresButton.titleLabel?.textAlignment = .Center
        resetScoresButton.center.x = view.center.x
        resetScoresButton.backgroundColor = UIColor.yellowColor()
        resetScoresButton.addTarget(self, action: "resetScores:", forControlEvents: .TouchUpInside)
        
        view.addSubview(resetScoresButton)
        
        
//        winnerMessage.image = UIImage(named: "RestartButton")
//        winnerMessage.hidden = true
//        view.addSubview(winnerMessage)
        
        let buttonHW = 100
        let buttonSpacing = 4
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        let image = UIImage(named: "White")
        
        for (r,row) in grid.enumerate() {
            for (c, _) in row.enumerate() {
                let x = c * (buttonHW + buttonSpacing) + leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: buttonHW, height: buttonHW))
                button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
                
                button.row = r
                button.col = c
                
                button.setImage(image, forState: .Normal)
                
                view.addSubview(button)
                
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

