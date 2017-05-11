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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    /** When 'Add' button is tapped:
        1.) Initialize 'task'
        2.) Set values to variables 'name' and 'important' in 'task'
        3.) Go back to TasksViewController (Popping View Controller)
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
        
        // 3.) Pop Back
        
        navigationController?.popViewController(animated: true)
        
    }

}


   

