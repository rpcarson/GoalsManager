//
//  SavedData.swift
//  Goals
//
//  Created by Reed Carson on 2/25/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import Foundation





struct DateFormatter {
    
    func formatDate(date: NSDate) -> String {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let dateString = formatter.stringFromDate(date)
        
        return dateString
        
    }
}


struct GoalsData {
    
    static var goalNamesArray: [String] = [] {
        
        didSet {
            
            DataManager().saveData(goalNamesArray)
            print("goal saved")
            
        }
    }
    
    static var goalDetailsSavedData: [String:[String:AnyObject]] = [:] {
        
        didSet {
            
            DataManager().saveDetails(goalDetailsSavedData)
            print("details saved")
            
        }
        
        
    }
    
    
    static var currentSelectedGoalIndex: Int?
    
    static var summaryText: String = "default"

}



class DataManager {
    
    let defaults = NSUserDefaults.standardUserDefaults()

    func saveData(dataToBeSaved: [String]) {
        
        defaults.setObject(dataToBeSaved, forKey: "data")
        
    }
    
    func saveDetails(details: [String:[String:AnyObject]]) {
        
        defaults.setObject(details, forKey: "details")
        
    }
    

    
    func retrieveData(data: String) -> NSObject {
        
        guard let unwrappedData = defaults.stringForKey(data) else { print("data retrieve fail") ; return "nil" }
        
        return unwrappedData
        
        
    }
    
 
    
}





