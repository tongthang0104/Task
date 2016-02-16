//
//  TaskController.swift
//  Task
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class TaskController {
    
    // filePath string key
    private let kTasksKey = "tasks"
    
    var tasks: [Task] = []
    var completedTasks: [Task] {
        get {
            return tasks.filter({ $0.isComplete })
        }
    }
    
    var inCompleteTasks: [Task] {
        get {
            return tasks.filter({ !$0.isComplete })
        }
    }
    
    //CREATE
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    init() {
        self.tasks = mockTask
    }
    
    //READ
    var mockTask: [Task] {
        get {
            return [
                Task(title: "Eat lunch", note: "Pizza", dueDate: NSDate()),
                Task(title: "Walk dog", note: nil, dueDate: nil),
                Task(title: "Write Task Project again", note: "Try it from memory", dueDate: NSDate())
            ]
        }
    }
    
    func loadFromPersistence() {
        if let tasks = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath(kTasksKey)) as? [Task] {
            self.tasks = tasks
        }
    }
    
    //UPDATE
    
    func saveToPersistence() {
        if NSKeyedArchiver.archiveRootObject(self.tasks, toFile: filePath(kTasksKey)) {
            print("Save successful")
        } else {
            print("Save unsuccessful")
        }
        
    }
    
    //DELETE
    func deleteTask(task: Task) {
        if let index = tasks.indexOf(task) {
            tasks.removeAtIndex(index)
        }
    }
    
    // NSArchiving Path
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }
}

















