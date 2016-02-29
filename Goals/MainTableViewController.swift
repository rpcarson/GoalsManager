//
//  MainTableViewController.swift
//  Goals
//
//  Created by Reed Carson on 2/21/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit



class MainTableViewController: UITableViewController {
    
    @IBOutlet weak var textInput: TextInputField?
    
    @IBOutlet weak var textContainerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return GoalsData.goalNamesArray.count
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        GoalsData.currentSelectedGoalIndex = indexPath.row
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("dailyGoalCell", forIndexPath: indexPath) as! DailyGoalCell
        
        cell.dailyGoalTitle.text = GoalsData.goalNamesArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            let nameKey = GoalsData.goalNamesArray[indexPath.row]
            
            if GoalsData.goalNamesArray.contains(GoalsData.goalNamesArray[indexPath.row]) {
            
            GoalsData.goalNamesArray.removeAtIndex(indexPath.row)
                
            }
            
            GoalsData.goalDetailsSavedData.removeValueForKey(nameKey)
            
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
        }
        
        
    }
    
   // MARK: - UI Setup
    
    func barPlusButton() {
        
        textInput?.hidden = false
        textInput?.becomeFirstResponder()
        textContainerView.frame.size.height = 40
        
    }
    
    func configureView() {
        
        textInput?.viewController = self
        if let text = textInput {
            text.hidden = true
            text.delegate = textInput.self
            
            textContainerView.frame.size.height = 1
            
        }
        
        
        navigationItem.title = "Daily Goals"
        
        navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "barPlusButton"), animated: true)
        
    }
    
    
}
