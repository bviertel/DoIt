//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Brandon Viertel on 4/12/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    // Link to 'taskNameTextField'
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    // Link to 'importantSwitch' T/F
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    // Link to 'taskDescTextField'
    
    @IBOutlet weak var taskDescTextField: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    // Link to '+' button
    
    @IBAction func addTapped(_ sender: Any) {
        
        // Initialize 'task'
        
        // Following is Core Data related
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        // Set values accordingly in 'task'
        
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        task.desc = taskDescTextField.text!
        
        // Following is Core Data related, saving the data
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Pop back to Table View
        
        navigationController?.popViewController(animated: true)
        
    }

}


   

