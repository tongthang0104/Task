//
//  DateHelper.swift
//  Task
//
//  Created by Thang H Tong on 10/23/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

extension NSDate {
    func stringValue() -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        return formatter.stringFromDate(self)
    }
    
}