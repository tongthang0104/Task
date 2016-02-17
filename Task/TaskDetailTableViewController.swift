//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    //MARK: - Variables
    var task: Task?
    
    //MARK: - Outlets
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var dueDateTextField: UITextField!
    @IBOutlet var noteTextView: UITextView!
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        if let title = titleTextField.text, note = noteTextView.text {
            TaskController.sharedInstance.addTask(Task(title: title, note: note, dueDate: nil))
            
            navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
    
    
    
}
