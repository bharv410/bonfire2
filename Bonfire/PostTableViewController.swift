//
//  PostTableViewController.swift
//  Bonfire
//
//  Created by Benjamin Harvey on 4/19/16.
//  Copyright © 2016 Benjamin Harvey. All rights reserved.
//

import UIKit
import Parse

class PostTableViewController: UITableViewController {

     var items: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
        var query = PFQuery(className:"TestObject")
        
        var data: Void? = query.findObjectsInBackgroundWithBlock({(objects:[PFObject]?, error:NSError?) -> Void in
            
            
            for object: PFObject in objects! {
                
                self.items.append(object["foo"]as! (String))
            }
            self.tableView.reloadData()
        })
        
        
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
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.items.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        self.dismissViewControllerAnimated(true) {
            
        }
        
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    

}
