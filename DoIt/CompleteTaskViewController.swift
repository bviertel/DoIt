//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Brandon Viertel on 4/12/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    // Variable 'task' to hold 'Task' when selected and sent from the Main View Controller
    
    var task = Task()
    
    // Variable label to change to whatever 'task' has been selected from the Main View Controller
    
    @IBOutlet weak var completeTaskLabel: UILabel!
    
    // Variable 'previousVC' holds the information for the Previous View Controller, which happens to be the Main View Controller
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Copied from 'CreateTaskViewController' to add exclamation point to the beginning of 'tasks' with a 'true' important value
        
        if task.important {
            
            completeTaskLabel.text = "❗️ \(task.name)"
            
        } else {
            
            completeTaskLabel.text = task.name
            
        }

    }

    /** When the 'Complete' button is tapped:
        1.) Remove the previously selected item
        2.) Reload the data in the table
        3.) Go back to the Main View Controller
    */
    
    @IBAction func CompleteTapped(_ sender: Any) {
        
        // 1.)
        
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        
        // 2.)
        
        previousVC.tableView.reloadData()
        
        // 3.)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}