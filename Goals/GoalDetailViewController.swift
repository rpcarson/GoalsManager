//
//  GoalDetailViewController.swift
//  Goals
//
//  Created by Reed Carson on 2/24/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit


class GoalDetailViewController: UIViewController, TextDelegate {
    
   
    @IBOutlet weak var goalTitle: UILabel?
    @IBOutlet weak var goalCreationDate: UILabel?
    @IBOutlet weak var goalSummaryTextBox: UITextView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - SETUP UI
    
    func updateTextView() {
        
        if let title = goalTitle?.text {
            
            print("updating detail view summary")

            goalSummaryTextBox?.text = GoalsData.goalDetailsDictionary["\(title):summary"] as? String

        }
    }
    
    func configureView() {
        
        if let index = GoalsData.currentSelectedGoalIndex {
            
            goalTitle?.text = GoalsData.goalNamesArray[index]
            
        }
        
        
        if let title = goalTitle?.text {
            
            print("title found")
            
            let dateKey = "\(title):date"
            let summaryKey = "\(title):summary"
            
            if let date = GoalsData.goalDetailsDictionary[dateKey] as? NSDate {
                
                print("date found")
                
                print("date is \(date)")
                
                goalCreationDate?.text = "Goal Created: \(DateFormatter().formatDate(date))"
                
            }
            
            if let summary = GoalsData.goalDetailsDictionary[summaryKey] as? String {
                
                print("summary found: \(summary)")
                
                goalSummaryTextBox?.text = summary
                
            }
            
        }

        
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destination = segue.destinationViewController as? TextEditViewController {
            destination.textDelegate = self
            destination.currentGoal = goalTitle?.text
            
            destination.textView?.text = goalSummaryTextBox?.text
            
        }
    }
}
