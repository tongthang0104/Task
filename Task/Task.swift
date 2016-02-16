//
//  Task.swift
//  Task
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding {
    
    private let kTitleKey = "title"
    private let kNoteKey = "note"
    private let kDueDateKey = "dueDate"
    private let kIsCompleteKey = "isComplete"
    
    var title: String
    var note: String?
    var dueDate: NSDate?
    var isComplete: Bool = false
    
    init(title: String, note: String?, dueDate: NSDate?) {
        self.title = title
        self.note = note
        self.dueDate = dueDate
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObjectForKey(kTitleKey) as? String else {
            self.title = ""
            self.note = nil
            self.dueDate = nil
            self.isComplete = false
            
            super.init()
            return nil
        }
        
        self.title = title
        self.note = aDecoder.decodeObjectForKey(kNoteKey) as? String
        self.dueDate = aDecoder.decodeObjectForKey(kDueDateKey) as? NSDate
        self.isComplete = aDecoder.decodeObjectForKey(kIsCompleteKey) as! Bool
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.title, forKey: kTitleKey)
        aCoder.encodeObject(self.note, forKey: kNoteKey)
        aCoder.encodeObject(self.dueDate, forKey: kDueDateKey)
        aCoder.encodeObject(self.isComplete, forKey: kIsCompleteKey)
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        let rhs = self
        if let lhs = object {
            return (lhs.title == rhs.title) && (lhs.note == rhs.note) && (lhs.isComplete == rhs.isComplete)
        }
        return false
    }
}
