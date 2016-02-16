//
//  TaskController.swift
//  Task
//
//  Created by Andrew Porter on 2/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class TaskController {
    
    private let kTaskKey = "tasks"
    
    static let sharedController = TaskController()
    
    var tasks: [Task] = []
    
    var completedTasks: [Task] {
        return tasks.filter({ $0.isComplete })
    }
    
    var incompleteTasks: [Task] {
        return tasks.filter({ !$0.isComplete })
    }
    
    init() {
        
        // Uncomment the next line to use mock data
//        self.tasks = self.mockTasks
        loadFromPersistentStorage()
    }
    
    // CREATE
    func addTask(task: Task) {
        tasks.append(task)
        saveToPersistentStorage()
    }
    
    // READ
    var mockTasks: [Task] {
        get {
            let task1 = Task(title: "Feed Dog", note: nil, dueDate: nil)
            let task2 = Task(title: "Do Coding", note: "Work on Task project", dueDate: NSDate())
            let task3 = Task(title: "Walk the Dog", note: nil, dueDate: NSDate())
            let task4 = Task(title: "Take dog potty", note: "pick up poop", dueDate: nil)
            task4.isComplete = true
            
            return [task1, task2, task3, task4]
        }
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }
    
    func saveToPersistentStorage() {
        NSKeyedArchiver.archiveRootObject(self.tasks, toFile: self.filePath(kTaskKey))
    }
    
    // UPDATE
    func loadFromPersistentStorage() {
        if let data = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(kTaskKey)) as? [Task] {
            self.tasks = data
        }
    }
    
    // DELETE
    func deleteTask(task: Task) {
        
        if let index = tasks.indexOf(task) {
            tasks.removeAtIndex(index)
        }
        saveToPersistentStorage()
    }
}









