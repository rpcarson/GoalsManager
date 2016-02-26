//
//  MainMenuViewController.swift
//  Goals
//
//  Created by Reed Carson on 2/24/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        let defaults = NSUserDefaults.standardUserDefaults()
        if let savedData = defaults.arrayForKey("data") {
            
            print("loaded?")
            GoalsData.dailyGoalsArray = savedData as! [String]
            
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
