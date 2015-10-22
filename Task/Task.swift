//
//  Task.swift
//  Task
//
//  Created by Thang H Tong on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding{

    var name: String
    var notes: String?
    var due: NSDate?
    var isComplete: Bool? //computed properties?
    
    private let NameKey = "name"
    private let notesKey = "notes"
    private let dueKey = "due"
    private let isCompleteKey = "isComplete"
    
    init(name: String, notes: String, due: NSDate, isComplete: Bool) {
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    }
    
    
    @objc required init?(coder aDecoder: NSCoder) {

    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        
    }

    override func isEqual(object: AnyObject?) -> Bool {
        if let rhs = object as? Task {
            
            return (self.name == rhs.name) && (self.notes == rhs.notes) && (self.isComplete == rhs.isComplete)
        } else {
            return false
        }
    }

    
}
