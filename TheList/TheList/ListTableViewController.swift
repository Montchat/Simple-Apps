//
//  ListTableViewController.swift
//  TheList
//
//  Created by Joe E. on 9/28/15.
//  Copyright © 2015 Joe E. All rights reserved.
//

import UIKit

let API_ROOT = "https://api.github.com"
let myProfileURL = API_ROOT + "users/Montchat"

class ListTableViewController: UITableViewController {
    var listItems: [[String:AnyObject]] = [
        [
        "name" : "Steve",
        "likes" : 5
        ],
        
        [
            "name" : "Banana",
            "likes" : 30
        ],
        
        [
            "name" : "Despicable",
            "likes" : 100
        ],
        
        [
//            "name" : "Me",
            "likes" : 2
        ],
        
        [
            "name" : "Gru",
//            "likes" : 5
        ],
        
    ]
    
    let users:[[String:AnyObject?]] = [
    
        [
            
        "login": "Montchat",
        "id": 7514990,
        "avatar_url": "https://avatars.githubusercontent.com/u/7514990?v=3",
        "gravatar_id": "",
        "url": "https://api.github.com/users/Montchat",
        "html_url": "https://github.com/Montchat",
        "followers_url": "https://api.github.com/users/Montchat/followers",
        "following_url": "https://api.github.com/users/Montchat/following{/other_user}",
        "gists_url": "https://api.github.com/users/Montchat/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/Montchat/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/Montchat/subscriptions",
        "organizations_url": "https://api.github.com/users/Montchat/orgs",
        "repos_url": "https://api.github.com/users/Montchat/repos",
        "events_url": "https://api.github.com/users/Montchat/events{/privacy}",
        "received_events_url": "https://api.github.com/users/Montchat/received_events",
        "type": "User",
        "site_admin": false,
        "name": nil,
        "company": nil,
        "blog": nil,
        "location": nil,
        "email": nil,
        "hireable": nil,
        "bio": nil,
        "public_repos": 13,
        "public_gists": 0,
        "followers": 2,
        "following": 2,
        "created_at": "2014-05-07T17:14:11Z",
        "updated_at": "2015-08-23T13:59:32Z"
        
        ]
        
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listItems.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath)
        
        let listItem = listItems[indexPath.row]
        
        let name = listItem["name"] as? String ?? "No Name" // If this is nil, then assign the value as "No name"
        let likes = listItem["likes"] as? Int ?? 0 // If this is nil, then assign the value as 0
//        if let name = listItem["name"] as? String,
//           let likes = listItem["likes"] as? Int
//           where name != "Banana" {
            cell.textLabel?.text = "\(name) \(likes)"
//
//        }
        return cell
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
