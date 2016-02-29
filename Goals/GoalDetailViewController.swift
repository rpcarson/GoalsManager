//
//  GoalDetailViewController.swift
//  Goals
//
//  Created by Reed Carson on 2/24/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

protocol TextDelegate {
    
    func updateTextView()
    
}



class GoalDetailViewController: UIViewController, TextDelegate {

    @IBAction func test(sender: AnyObject) {
        
        updateTextView()
    
    }
    

    func updateTextView() {
        
        print(goalSummaryTextBox?.text)
        
        print("delegate called")
        
        self.goalSummaryTextBox?.text = GoalsData.summaryText
        
        print(goalSummaryTextBox?.text)

    }
    
    @IBOutlet weak var goalTitle: UILabel?
    @IBOutlet weak var goalCreationDate: UILabel?
    @IBOutlet weak var goalSummaryTextBox: UITextView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalSummaryTextBox?.text = GoalsData.summaryText
        
        if let index = GoalsData.currentSelectedGoalIndex {
            
            goalTitle?.text = GoalsData.goalNamesArray[index]
            
        }
        
        if let title = goalTitle?.text,
           
            let selectedGoal = GoalsData.goalDetailsSavedData[title] {
                
                print(selectedGoal)
            
                if let date = selectedGoal["date"] as? NSDate {
                    
                    print("date converted")

                
                goalCreationDate?.text = "Goal Created: \(DateFormatter().formatDate(date))"
                    
                }
                
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
