//
//  TaskController.swift
//  Task
//
//  Created by Thang H Tong on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class TaskController {
    
    static let sharedController = TaskController()
    static let TaskKey = "taskKey"
    
    var tasksArray: [Task] = []
    var completedTaskArray: [Task] = []
    var incompletedTaskArray: [Task] = []
    
    //MARK: Mock Task
    var mockTasks: [Task] {
    
        let task1 = Task(name: "Complete Project", notes: "Part 2")
        let task2 = Task (name: "Have Lunch", notes: "Eat bananas", due: NSDate(), isComplete: true)
        let task3 = Task(name: "Go to bed")
        task3.isComplete = false
        let task4 = Task(name: "Prepare for lesson", notes: "on DevMnt Website", isComplete: false)
        
        return [task1, task2, task3, task4]
    }
    
    init() {
        self.tasksArray = mockTasks
    }
    
    func taskCompleted(task: [Task]) -> [Task] {
        for taskCompleted in task {
            if taskCompleted.isComplete == true {
                self.completedTaskArray.append(taskCompleted)
            }
        }
        return completedTaskArray
    }
    
    func taskInCompleted(task: [Task]) -> [Task] {
        for taskInCompleted in task {
            if taskInCompleted.isComplete == false {
                self.incompletedTaskArray.append(taskInCompleted)
            }
        }
        return incompletedTaskArray
    }
    
    func addTask(task: Task) {
        tasksArray.append(task)
    }
    
    func remove(task: Task) {
      
        let index = tasksArray.indexOf(task)
        
        if let index = index {
        self.tasksArray.removeAtIndex(index)
        
        }
    }
 
    func saveToPersistentStorage() {
        NSKeyedArchiver.archiveRootObject(self.tasksArray, toFile: self.filePath()
    }
}

    
    
    