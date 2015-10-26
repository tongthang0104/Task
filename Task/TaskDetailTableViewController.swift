//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Thang H Tong on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class TaskDetailTableViewController: UITableViewController, UITextFieldDelegate {

    //MARK: Properties
    
    var task = Task?()
    var dueDateValue: NSDate?

    @IBOutlet weak var taskTitle: UINavigationItem!
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskDueTextField: UITextField!
    
    @IBOutlet weak var taskNoteTextField: UITextView!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure the UIDatePicker when screen loaded
        
       taskDueTextField.inputView = dueDatePicker
    }
    
    //MARK: Action
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        
        if let task = self.task {
            task.name = self.taskNameTextField.text!
            task.due = dueDateValue
            task.notes = self.taskNoteTextField.text
            updateWithTask(task)
            
        } else {
            let newTask = Task(name: self.taskNameTextField.text!, notes: self.taskNoteTextField.text, due: dueDateValue)
            TaskController.sharedController.addTask(newTask)
            self.task = newTask
        }
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        
            taskDueTextField.text = sender.date.stringValue()
            self.dueDateValue = sender.date
    }
    
    @IBAction func userTappedView(sender: UITapGestureRecognizer) {
        self.taskDueTextField?.resignFirstResponder()
        self.taskNoteTextField?.resignFirstResponder()
        self.taskNameTextField?.resignFirstResponder()
    }

    //MARK: Update With Task
    
    func updateWithTask(task: Task) {
        
        self.task = task
        title = task.name
        self.taskNameTextField?.text = task.name
        
        if let due = task.due {
            self.taskDueTextField?.text = due.stringValue()
        }
        
        if let notes = task.notes {
            self.taskNoteTextField?.text = notes
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    } 
    


}
