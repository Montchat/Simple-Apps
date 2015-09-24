//
//  ViewController.swift
//  StoryboardLess
//
//  Created by Joe E. on 9/24/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var grid = [[0,0,0],[0,0,0],[0,0,0]] //first row, second row, third row
    
    var player1Score = 0
    var player2Score = 0
    var stalemateScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        for (r,row) in grid.enumerate() {
            for (c,_) in row.enumerate() {
                let x =  c * 110
                let y = r * 110
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: 100, height: 100))
                button.backgroundColor = UIColor.yellowColor()
                button.row = r
                button.col = c
                
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                view.addSubview(button)
                
            }
            
        }
        
    }
    
    func spacePressed(button: TTTButton) {
        if button.player == 0 {
            button.player = isPLayer1Turn ? 1 : 2
            
        }
        
        isPLayer1Turn = !isPLayer1Turn
        button.player = isPLayer1Turn ? 1 : 2
        grid[button.row][button.col] = isPLayer1Turn ? 1 : 2
        
        checkForWinner()
        
    }
    
    func checkForWinner() {
        //row1 0,0 0,1 0,2
        //row2 1,0 1,1 1,2
        //row3 2,0 2,1 2,2
        //col1 0,0 1,0 2,0
        //col2 0,1 1,1 2,1
        //col3 0,2 1,2 2,2
        //dia1 0,0 1,1 2,2
        //dia2 2,0 1,1 0,2
        
        let possibilities = [
            ((0,0),(0,1),(0,2))
        
        ]
        
        for possibility in possibilities {
            let (p1,p2,p3) = possibility
            
            let value1 = grid[p1.0][p1.1]
            let value2 = grid[p2.0][p2.1]
            let value3 = grid[p3.0][p3.1]
            
            if value1 == value2 && value2 == value3 && value1 != 0 {
                print("\(value1)")
                
            } else {
                print("all zeros")
                
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}

