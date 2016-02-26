//
//  GoalDetailViewController.swift
//  Goals
//
//  Created by Reed Carson on 2/24/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class GoalDetailViewController: UIViewController {
    
    @IBOutlet weak var goalTitle: UILabel?
    
    @IBOutlet weak var goalCreationDate: UILabel?
    
    @IBOutlet weak var goalSummaryTextBox: UITextView?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let index = GoalsData.currentSelectedGoalIndex {
            
            goalTitle?.text = GoalsData.dailyGoalsArray[index]
            
        }
        
        if let title = goalTitle?.text,
            
            goalDetails = GoalsData.goalDetailsDictionary[title] {
                
                if goalDetails.dateCreated != nil {
                    
                   let date = DateFormatter().formatDate(goalDetails.dateCreated!)
                    
                    goalCreationDate?.text = date
                        
                    
                }
                
        }
        
        
        // Do any additional setup after loading the view.
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
