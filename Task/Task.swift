//
//  Task.swift
//  Task
//
//  Created by Andrew Porter on 2/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding {
    
    private let kTitleKey = "title"
    private let kNoteKey = "note"
    private let kDueDate = "dueDate"
    private let kIsComplete = "isComplete"
    
    let title: String
    let note: String?
    let dueDate: NSDate?
    var isComplete: Bool = false
    
    init(title: String, note: String?, dueDate: NSDate?) {
        self.title = title
        self.note = note
        self.dueDate = dueDate
    }
    
    @objc required init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObjectForKey(kTitleKey) as? String, note =  aDecoder.decodeObjectForKey(kNoteKey) as? String, dueDate = aDecoder.decodeObjectForKey(kDueDate) as? NSDate, isComplete = aDecoder.decodeObjectForKey(kIsComplete) as? Bool else {
            self.title = ""
            self.note = ""
            self.dueDate = NSDate()
            self.isComplete = false
            
            return
        }
        
        self.title = title
        self.note = note
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.title, forKey: kTitleKey)
        aCoder.encodeObject(self.note, forKey: kNoteKey)
        aCoder.encodeObject(self.dueDate, forKey: kDueDate)
        aCoder.encodeObject(self.isComplete, forKey: kIsComplete)
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let rhs = object {
            return self.title == rhs.title && self.note == rhs.note && self.isComplete == rhs.isComplete
        }
        return false
    }
}

func ==(lhs: Task, rhs: Task) -> Bool {
    return lhs.title == rhs.title && lhs.note == rhs.note && lhs.isComplete == rhs.isComplete
}


