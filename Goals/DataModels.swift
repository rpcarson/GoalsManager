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
    
    static var dailyGoalsArray: [String] = [] {
        
        didSet {
            
            DataManager().saveData(dailyGoalsArray)
            print("goal saved")
            
        }
    }
    
    static var goalDetailsDictionary: [String:GoalDetails] = [:]
    
    static var currentSelectedGoalIndex: Int?

}



struct GoalDetails {
    var dateCreated: NSDate?
    var goalSummary: String?
    var goalTitle: String?
}




class DataManager {
    
    let defaults = NSUserDefaults.standardUserDefaults()

    func saveData(dataToBeSaved: [String]) {
        
        defaults.setObject(dataToBeSaved, forKey: "data")
        
    }
    

    
    func retrieveData(data: String) -> NSObject {
        
        guard let unwrappedData = defaults.stringForKey(data) else { print("data retrieve fail") ; return "nil" }
        
        return unwrappedData
        
        
    }
    
    func createDetailsDictionary(goalDetails: GoalDetails) {
        
        if let key = goalDetails.goalTitle {
    
        GoalsData.goalDetailsDictionary.updateValue(goalDetails, forKey: key)
            
            
        }
    
    }
    
}





