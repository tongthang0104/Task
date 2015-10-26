//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Thang H Tong on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    //MARK: Properties
    
    var task: Task?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.sharedController.incompletedTaskArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! ButtonTableViewCell
        let tasks = TaskController.sharedController.incompletedTaskArray[indexPath.row]
        
        cell.updateWithTask(tasks)
        cell.delegate = self
        return cell
    }
    
    func buttonTappedValueChanged(cell: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPathForCell(cell) else {return}
        let tasks = TaskController.sharedController.incompletedTaskArray[indexPath.row]
        tasks.isComplete = !tasks.isComplete.boolValue
        TaskController.sharedController.saveToPersistentStorage()
        
        tableView.reloadData()
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let task = TaskController.sharedController.incompletedTaskArray[indexPath.row]
            TaskController.sharedController.remove(task)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
        }    
    }
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

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "editTask" {
            
            if let displayTask = segue.destinationViewController as? TaskDetailTableViewController {
                _ = displayTask.view
                
                if let selectedRows = tableView.indexPathForSelectedRow?.row {
                    let task = TaskController.sharedController.incompletedTaskArray[selectedRows]
                    displayTask.updateWithTask(task)
                }
            }
        }
    }
}
