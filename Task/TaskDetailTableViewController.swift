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
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
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
    
    //MARK: - Buttons
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        if let name = taskNameTextField.text, notes = notesTextView.text {
            let task = Task(title: name, note: notes, dueDate: nil)
            self.task = task
            
            TaskController.sharedController.addTask(task)
        }
    }
    
    //MARK: - Functions
    func updateWithTask(task: Task) {
        taskNameTextField.text = task.title
        if let notes = task.note, dueDate = task.dueDate {
            notesTextView.text = notes
            dueDateTextField.text = dueDate.stringValue()
        }
    }
}
