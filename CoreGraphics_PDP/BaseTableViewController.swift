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
        return 9
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 2 {
            return 4
        }
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell?.textLabel?.text = "Example\(indexPath.section)_\(indexPath.row)"
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("Example\(indexPath.section)_\(indexPath.row)", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController
        let indexPath = sender as! NSIndexPath
        destVC.navigationItem.title = "Example #\(indexPath.section)_\(indexPath.row)"
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Example #\(section + 1)"
    }
    
}
