//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Brandon Viertel on 4/12/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    // Variable to hold the 'taskNameTextField' value
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    // Variable to hold the 'importantSwitch' value T/F
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    // Variable 'previousVC' holds the information for the Previous View Controller, which happens to be the TasksViewController
    // Do not need: Core Data related
    // var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    /** When 'Add' button is tapped:
        1.) Initialize 'task'
        2.) Set values to variables 'name' and 'important' in 'task'
        3***REMOVED.) Add 'task' to array in TasksViewController
        4***REMOVED.) Refresh data in TasksViewController
        5.) Go back to TasksViewController (Popping View Controller)
    */
    
    @IBAction func addTapped(_ sender: Any) {
        
        // 1.)
        
        // Following is Core Data related
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        // 2.)
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        // Following is Core Data related
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        // 3.)
        // Don't need: Core Data Related
        // previousVC.tasks.append(task)
        
        // 4.)
        // Don't need: Core Data Related
        // previousVC.tableView.reloadData()
        
        // 5.) Pop Back
        
        navigationController?.popViewController(animated: true)
        
    }

}


   

