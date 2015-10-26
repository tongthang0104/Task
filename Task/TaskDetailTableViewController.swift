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
        self.taskTitle.title = task.name
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
