//
//  TextEditViewController.swift
//  Goals
//
//  Created by Reed Carson on 2/28/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class TextEditViewController: UIViewController, UITextViewDelegate {
    
    weak var textDelegate: TextDelegate?
    
    var currentGoal: String?
    
    @IBOutlet weak var textView: SummaryTextView?
    
    
    // clear text on begin typing
    func textViewDidChange(textView: UITextView) {
        
        guard let text = self.textView else { return }
        
        if text.hasPlaceholder == true {
            
            let string = text.text
            
            let characterArray = string.characters.map{String($0)}
            
            if let lastCharacter = characterArray.last {
                
                text.text = lastCharacter
            }
            
            text.hasPlaceholder = false
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView?.delegate = self
        textView?.becomeFirstResponder()
        configureView()
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - SETUP UI
    
    func configureView() {
        
        navigationItem.title = "Edit Description"
        navigationItem.setRightBarButtonItem((UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "pop")), animated: true)
        
        
        if let title = currentGoal {
            
            let summaryKey = "\(title):summary"
            
            if let summary = GoalsData.goalDetailsDictionary[summaryKey] as? String {
                    
                    textView?.text = summary
                    textView?.hasPlaceholder = false
        
            } else {
                
                textView?.text = textView?.placeholderText
                
            }
            
        }
        
    }
    
    
    // MARK: - Navigation
    
    
    func pop() {
        
        
        if let text = textView?.text {
                        
            print("summary was created")
        
            let key = "\(currentGoal!):summary"
            
            GoalsData.goalDetailsDictionary.updateValue(text, forKey: key)
        
            print(key)
        
        }
        
        textDelegate?.updateTextView()
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
}
