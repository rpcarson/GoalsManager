//
//  TextEditViewController.swift
//  Goals
//
//  Created by Reed Carson on 2/28/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class TextEditViewController: UIViewController {
    
    var textDelegate: TextDelegate?
    
    
    @IBOutlet weak var textView: UITextView?
    
    func configureView() {
        
        navigationItem.title = "Edit Description"
        navigationItem.setRightBarButtonItem((UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "segue")), animated: true)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        textView?.becomeFirstResponder()
        
        
        configureView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation

    
    func segue() {
        
        textDelegate = GoalDetailViewController()
        
        if let text = textView?.text {
            
            
            GoalsData.summaryText = text

            
        }
        
        
        textDelegate?.updateTextView()
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    
    
}
