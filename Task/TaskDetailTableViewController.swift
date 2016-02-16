//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Andrew Porter on 2/14/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    @IBOutlet var taskNameTextField: UITextField!
    @IBOutlet var dueDateTextField: UITextField!
    @IBOutlet var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    var task: Task?
    var dueDateValue: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = dueDatePicker
        
        if let task = self.task {
            updateWithTask(task)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        if let task = self.task {
            task.dueDate = dueDatePicker.date
            task.note = notesTextView.text
        } else {
            if let title = taskNameTextField.text {
                let dueDate = dueDatePicker.date
                let note = notesTextView.text
                
                let task = Task(title: title, note: note, dueDate: dueDate)
                TaskController.sharedController.addTask(task)
            }
        }
        navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        dueDateTextField.text = sender.date.stringValue()
        dueDateValue = sender.date
    }
    @IBAction func userTappedView(sender: UITapGestureRecognizer) {
        self.taskNameTextField.resignFirstResponder()
        self.dueDateTextField.resignFirstResponder()
        self.notesTextView.resignFirstResponder()
    }
    
    //MARK: - Functions
    func updateWithTask(task: Task) {
        taskNameTextField.text = task.title
        if let notes = task.note, dueDate = task.dueDate {
            self.notesTextView.text = notes
            self.dueDateTextField.text = dueDate.stringValue()
        }
    }
}
