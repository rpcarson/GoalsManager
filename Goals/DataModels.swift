//
//  SavedData.swift
//  Goals
//
//  Created by Reed Carson on 2/25/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import Foundation


protocol TextDelegate : class {
    
    func updateTextView()
    
}



struct DateFormatter {
    
    func formatDate(date: NSDate) -> String {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let dateString = formatter.stringFromDate(date)
        
        return dateString
        
    }
}


class DictionaryCreator {
    
    static func createDictionary(key: String, dataName: String, dataObject: AnyObject) {
        
        var targetDictionary = GoalsData.goalDetailsSavedData[key]
        
        targetDictionary?.updateValue(dataObject, forKey: dataName)
        
    }
}

enum DictionaryValues {
    case Title
    case Date
    case Summary
}

class BreakdownDictionary {
    
    static func openDictionary(mainKey: String, desiredValue: DictionaryValues) -> AnyObject {
        
        if let dictionary = GoalsData.goalDetailsSavedData[mainKey],
            let date = dictionary["date"],
            let summary = dictionary["summary"] {
                
                switch desiredValue {
                case .Date: return date
                case .Summary: return summary
                case .Title: return dictionary
                    
                }
        }
    
        return "missing value"
    
    }
}



struct GoalsData {
    
    static var goalNamesArray: [String] = [] {
        
        didSet {
            
            DataManager().saveData(goalNamesArray)
            print("goal saved")
            
        }
    }
    
    static var goalDetailsDictionary: [String:AnyObject] = [:] {
        
        didSet {
            
            print("goalDetailsDictionary updated")
            
            DataManager().saveDetailsDictionary(goalDetailsDictionary)
        
        
    }
        
    }
    
    static var goalDetailsSavedData: [String:[String:AnyObject]] = [:] {
        
        didSet {
            
            DataManager().saveDetails(goalDetailsSavedData)
        
        print("details saved")
            
        }
        
        
    }
    
    
    static var currentSelectedGoalIndex: Int?
        
}



class DataManager {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func saveData(dataToBeSaved: [String]) {
        
        defaults.setObject(dataToBeSaved, forKey: "data")
        
    }
    
    func saveDetails(details: [String:[String:AnyObject]]) {
        
        defaults.setObject(details, forKey: "details")
        
    }
    
    static func appendDetailsDictionary(goalName: String, dataName: String, data: AnyObject) {
        
        let key = "\(goalName):\(dataName)"
        
        print(key)
        
        GoalsData.goalDetailsDictionary.updateValue(data, forKey: key)
        
    }
    
     func saveDetailsDictionary(details: [String:AnyObject]) {
        
        defaults.setObject(details, forKey: "detailsDictionary")
    }
}





