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
    
    var tasksArray: [Task] = []
    
    //Filter the taskArray to get any task that has isComplete = true
    
    var completedTaskArray: [Task] {
        return tasksArray.filter({$0.isComplete.boolValue})
    }
    
    // isCompleted = false
    var incompletedTaskArray: [Task] {
        return tasksArray.filter({!$0.isComplete.boolValue})
    }
    
    //MARK: Mock Task
    var mockTasks: [Task] {
    
        let task1 = Task(name: "Complete Project", notes: "Part 2")
        let task2 = Task (name: "Have Lunch", notes: "Eat bananas", due: NSDate())
        task2.isComplete = true
        let task3 = Task(name: "Go to bed")
        task3.isComplete = false
        let task4 = Task(name: "Prepare for lesson", notes: "on DevMnt Website")
        task4.isComplete = false
        return [task1, task2, task3, task4]
    }
    
    init() {
        self.tasksArray = mockTasks
        
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
 
}

    
    
    