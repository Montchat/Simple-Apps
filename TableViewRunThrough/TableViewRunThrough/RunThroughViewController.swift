//
//  RunThroughViewController.swift
//  TableViewRunThrough
//
//  Created by Joe E. on 1/13/16.
//  Copyright © 2016 Joe E. All rights reserved.
//

import UIKit

private let CELL = "cell"

class RunThroughViewController: UIViewController {
    
    let edwardsFamily = ["Joe","Jack","Dad","Mom"] 

    @IBOutlet weak var familyMemberLabel: UILabel!
    @IBOutlet weak var familyMemberView: UIView!
    @IBOutlet weak var familyMemberTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting the tableViews delegate and dataSource
        familyMemberTableView.delegate = self ; familyMemberTableView.dataSource = self
        
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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return edwardsFamily.count }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: CELL) ; cell.textLabel?.text = edwardsFamily[indexPath.row]
        cell.layer.cornerRadius = 0.25
        
        return cell
        
    }
    
}

extension RunThroughViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UIView.animateWithDuration(0.33) { () -> Void in
            self.familyMemberLabel.alpha = 0 ; self.familyMemberLabel.text = self.edwardsFamily[indexPath.row] ; self.familyMemberLabel.alpha = 1
            
        }
        
    }

}

extension RunThroughViewController {

}