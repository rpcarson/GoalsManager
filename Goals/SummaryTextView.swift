//
//  SummaryTextView.swift
//  Goals
//
//  Created by Reed Carson on 2/25/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class SummaryTextView: UITextView, UITextViewDelegate {
    
  
    var hasPlaceholder: Bool = true
    
    let placeholderText: String = "enter a description of your goal"
    
    func addToDetailsDictionary(title: String, text: String) {
        
        var summaryDictionary: [String:AnyObject] = ["summary":text]
        
        GoalsData.goalDetailsSavedData.updateValue(summaryDictionary, forKey: title)
    }
}


