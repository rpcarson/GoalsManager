//
//  TextInputField.swift
//  Goals
//
//  Created by Reed Carson on 2/21/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit




class TextInputField: UITextField, UITextFieldDelegate {
    
    
    let manager = DataManager()
    
    var viewController: MainTableViewController? // this must be set to self in viewDidLoad
    
    
    func reloadCells(view: UITableViewController) {
        
        view.tableView.reloadData()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        textField.hidden = true
        
        viewController?.textContainerView.frame.size.height = 1
        
        if let text = textField.text {
            
            let letters = NSCharacterSet.alphanumericCharacterSet()
            
            if (text.rangeOfCharacterFromSet(letters) != nil) {
            
            GoalsData.dailyGoalsArray.append(text)
                
                var goal = GoalDetails()
                goal.goalTitle = text
                goal.dateCreated = NSDate()
                manager.createDetailsDictionary(goal)
                print("\(GoalsData.goalDetailsDictionary)")
                
            }
            
            if let view = viewController {
            
            reloadCells(view)
                
            }
            
//            Overlord.mainViewInstance[0].tableView.reloadData()
            
        
        }
        
        print(GoalsData.dailyGoalsArray.count)
        
        
    
        
        
        
//        manager.saveData(GoalsData.dailyGoalsArray)

        return true
        
    }
    
}
