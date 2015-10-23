//
//  Task.swift
//  Task
//
//  Created by Thang H Tong on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding {

    var name: String
    var notes: String?
    var due: NSDate?
    var isComplete: Bool //computed properties?
    
    
    struct PropertyKey {
        
        static let nameKey = "name"
        static let notesKey = "notes"
        static let dueKey = "due"
        static let isCompleteKey = "isComplete"
    }
    
    //optional initiliaze can write abc: String? = nil
    init(name: String, notes: String? = nil, due: NSDate? = nil) {
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = false
        
        super.init()
    }
 
    //MARK: NSCoding
    
   @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(notes, forKey: PropertyKey.notesKey)
        aCoder.encodeObject(due, forKey: PropertyKey.dueKey)
        aCoder.encodeBool(isComplete, forKey: PropertyKey.isCompleteKey)
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        
        guard let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as? String else{
            self.name = ""
            self.notes = ""
            self.isComplete = false
            super.init()
            return nil
        }
      
        self.name = name
        self.notes = aDecoder.decodeObjectForKey(PropertyKey.notesKey) as? String
        
        self.due = aDecoder.decodeObjectForKey(PropertyKey.dueKey) as? NSDate
        self.isComplete = aDecoder.decodeBoolForKey(PropertyKey.isCompleteKey)
        
        super.init()
        
    }

    override func isEqual(object: AnyObject?) -> Bool {
        if let rhs = object as? Task {
            
            return (self.name == rhs.name) && (self.notes == rhs.notes) && (self.isComplete == rhs.isComplete)
        } else {
            return false
        }
    }

    
}
