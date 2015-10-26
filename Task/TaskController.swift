//
//  TaskController.swift
//  Task
//
//  Created by Thang H Tong on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let sharedController = TaskController()
    
    var tasksArray: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            return try moc.executeFetchRequest(request) as! [Task]
        }catch {
            return []
        }    
    }
    
    //Filter the taskArray to get any task that has isComplete = true
    
    var completedTaskArray: [Task] {
        return tasksArray.filter({$0.isComplete!.boolValue})
    }
    
    //isCompleted = false
    var incompletedTaskArray: [Task] {
        return tasksArray.filter({!$0.isComplete!.boolValue})
    }
    
    //MARK: Mock Task
    var mockTasks: [Task] {
    
        let task1 = Task(name: "Complete Project", notes: "Part 2")
        let task2 = Task (name: "Have Lunch", notes: "Eat bananas", due: NSDate(timeIntervalSinceReferenceDate: NSTimeInterval(60*60*24*3)))
        task2.isComplete = true
        let task3 = Task(name: "Go to bed")
        task3.isComplete = false
        let task4 = Task(name: "Prepare for lesson", notes: "on DevMnt Website")
        task4.isComplete = false
        return [task1, task2, task3, task4]
    }

    func addTask(task: Task) {
       saveToPersistentStorage()
    }

    func remove(task: Task) {
        
        if let moc = task.managedObjectContext {
            moc.deleteObject(task)
        }
        saveToPersistentStorage()
    }
    
 //MARK: Persistence
    
    func loadFromPersistentStorage() {
        
//        let unarchivedTasks = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(TaskKey))
//        
//        if let tasks = unarchivedTasks as? [Task] {
//            self.tasksArray = tasks
        }
    }
    
    func saveToPersistentStorage() {
        
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
                print("Error saving in \(error)")
            }
//        NSKeyedArchiver.archiveRootObject(self.tasksArray, toFile: self.filePath(TaskKey))
    }

//    func filePath(key: String) -> String {
//        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
//        let documentsPath: AnyObject = directorySearchResults[0]
//        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
//        
//        return entriesPath
//    }
//}

    
    
    