//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Ann Marie Seyerlein on 4/12/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    // Task Text Field Variable
    @IBOutlet weak var taskNameTextField: UITextField!
    
    // Important Switch Variable
    @IBOutlet weak var importantSwitch: UISwitch!
    
    //Connection to base view controller
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // When 'Add' button is tapped
    // Create a task from outlet information
    // Add new task to array in previous view controller
    @IBAction func addTapped(_ sender: Any) {
        
        // Creates new task to be added to list. DOES NOT ADD TO LIST!
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        previousVC.tasks.append(task)
        
        // Refreshes data
        previousVC.tableView.reloadData()
        
        // Popping view controller (automatically switches back to list after add is clicked)
        navigationController?.popViewController(animated: true)
        
        
        
    }
}

    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } ***CLAIMS WE DO NOT NEED*** */
    

   

