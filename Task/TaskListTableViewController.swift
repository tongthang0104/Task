//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Andrew Porter on 2/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - TableView Data Source methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedController.tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! ButtonTableViewCell
        
        let task = TaskController.sharedController.tasks[indexPath.row]
        cell.updateWithTask(task)
        cell.delegate = self
        
        return cell
    }
    
    //MARK: - TableView Delegate methods
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let task = TaskController.sharedController.tasks[indexPath.row]
            
            TaskController.sharedController.deleteTask(task)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    //MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toTaskDetail" {
            let taskDetailViewController = segue.destinationViewController as? TaskDetailTableViewController
            
            if let index = tableView.indexPathForSelectedRow?.row {
                let task = TaskController.sharedController.tasks[index]
                taskDetailViewController?.task = task
            }
        }
    }
}

extension TaskListTableViewController: ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {
        
        if let indexPath = tableView.indexPathForCell(sender) {
            let task = TaskController.sharedController.tasks[indexPath.row]
            
            task.isComplete = !task.isComplete
            
            TaskController.sharedController.saveToPersistentStorage()
            
            tableView.reloadData()
        }
    }
}




























