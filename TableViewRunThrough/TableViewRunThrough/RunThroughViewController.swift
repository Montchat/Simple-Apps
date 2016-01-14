//
//  RunThroughViewController.swift
//  TableViewRunThrough
//
//  Created by Joe E. on 1/13/16.
//  Copyright © 2016 Joe E. All rights reserved.
//

import UIKit

private let CELL = "cell"

private let NAME = "name"
private let AGE = "age"
private let FAVORITE_COLOR = "favorite color"
private let SEX = "sex"

class RunThroughViewController: UIViewController {
    
    //MARK: Properties
    let edwardsFamilyMembers =
    [
        
        [ "name" : "Joe", "age" : "25", "favorite color" : "yellow.", "sex" : "male" ],
        [ "name" : "Cindy", "age" : "50", "favorite color" : "blue." , "sex" : "female" ],
        [ "name" : "Jack", "age" : "22", "favorite color" : "red." , "sex" : "male" ],
        [ "name" : "Dad", "age" : "51", "favorite color" : "red & black, baby!", "sex" : "male" ]
        
    ]

    //MARK: @IBOutlets
    @IBOutlet weak var familyMemberLabel: UILabel!
    @IBOutlet weak var familyMemberView: UIView!
    @IBOutlet weak var familyMemberTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        familyMemberTableView.delegate = self ; familyMemberTableView.dataSource = self //setting the tableViews delegate and dataSource
        familyMemberLabel.text = "Select a family member from below" // tells the user to select a family member
        familyMemberView.layer.cornerRadius = familyMemberView.frame.height / 4 //makes the view have cornered edges

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RunThroughViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 1 }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return edwardsFamilyMembers.count }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let familyMember = edwardsFamilyMembers[indexPath.row] ; let name = familyMember[NAME] ; let age = familyMember[AGE]
        let cell = UITableViewCell(style: .Default, reuseIdentifier: CELL) ; cell.textLabel?.text = name; cell.detailTextLabel?.text = age

        return cell
        
    }
    
}

extension RunThroughViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UIView.animateWithDuration(0.33) { () -> Void in
            
            guard let name:String = self.edwardsFamilyMembers[indexPath.row][NAME] else { return }
            guard let age: String = self.edwardsFamilyMembers[indexPath.row][AGE] else { return }
            guard let favoriteColor:String = self.edwardsFamilyMembers[indexPath.row][FAVORITE_COLOR] else { return }
            
            guard let sex: String = self.edwardsFamilyMembers[indexPath.row][SEX] else { return }
            
            var msg2:String = ""
            
            if sex == "male" { msg2 = "His favorite color is \(favoriteColor)" } else { msg2 = "Her favorite color is \(favoriteColor)" }
            
            let msg = "\(name) is \(age) years old\r" + msg2
            print("message \(msg)")
            
            self.familyMemberLabel.alpha = 0 ; self.familyMemberLabel.text = msg ; self.familyMemberLabel.alpha = 1
            
        }
        
    }

}