//
//  TasksViewController.swift
//  DoIt
//
//  Created by Ann Marie Seyerlein on 4/11/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

// Inserted UITableViewDelegate and UITableViewDataSource
class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Variable for the 'tableView' in the TasksViewController
    
    @IBOutlet weak var tableView: UITableView!
    
    // Array of type Task that holds all of the added and pre-existing tasks
    
    var tasks : [Task] = []
    
    // Variable for the 'selectedIndex'. This is primarily used for the deletion of a task once the 'Complete' button is clicked on the CompleteTaskViewController. Used to temporarily store the index of the selected item in the array for location purposes in the array.
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Where does it get it's data from
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
    }
    
    // Number of rows in Table, 'numberOfRowsInSection'. Gets the number of rows from the amount of array entries
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        // Gets the number of rows from the count of array entries

        return tasks.count
        
    }
    
    // Information in cells, 'cellForRowAt'
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // New Constant 'cell' of class 'UITableViewCell'
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        // If the task.important value is true, add exclamation points to beginning
        
        if task.important {
            
            cell.textLabel!.text = "❗️ \(task.name)"
            
        } else {
            
            cell.textLabel!.text = task.name
            
        }
        
        // Returns the constant 'cell'
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTaskSegue" , sender: task)
    }
    
    // When creating a button, be sure to label a SPECIFC action (note 'plusTapped'), and link the segue right in the button tap action with performSegue
    @IBAction func plusTapped(_ sender: Any) {
        
        // 'nil' means nothing
        // For the withIdentifier section, go back to Storyboard and click on the seque between the two boards. In the right hand side under the Storyboard Segue section, there is an identifier section. Name it, and once you do, you insert the identifier into the following segue code. This allows the app to PERFORM a SEGUE with the specific IDENTIFIER or LOCATION
        
        // Perform Segue to ----> 'addSegue' e.g.
        
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    // Retrieving Core Data using MSFetch. Pulling from Core Data
    func getTasks() {
        
        
        
    }
    
    // Prepares for ALL segues from view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // For multiple segues, use IF statement

        if segue.identifier == "selectTaskSegue" {
         
            let nextVC = segue.destination as! CompleteTaskViewController
            
            nextVC.task = sender as! Task
            
            nextVC.previousVC = self
            
        }
    }
    
}

