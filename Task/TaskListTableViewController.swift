//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    //MARK: - TableView Data Source methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedInstance.tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath)
        
        let index = indexPath.row
        let task = TaskController.sharedInstance.tasks[index]
        
        cell.textLabel?.text = task.title
        
        return cell
    }
    
    //MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toTaskDetail" {
            if let taskDetailViewController = segue.destinationViewController as? TaskDetailTableViewController {
                if let index = tableView.indexPathForSelectedRow?.row {
                    let task = TaskController.sharedInstance.tasks[index]
                    taskDetailViewController.task = task
                }
            }
        }
    }
}