//
//  BaseTableViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 27.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 8
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell?.textLabel?.text = "Example #\(indexPath.section + 1)"
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("Example\(indexPath.section + 1)", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController
        destVC.navigationItem.title = "Example #\((sender as! NSIndexPath).section + 1)"
    }
    
}
