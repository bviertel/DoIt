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
        
        // Generates an initial task list using the 'makeTask' function from below.
        
        
        // Elimated the following line because we removed the method to create the task, because we do not want it prepopulated
        // tasks = makeTasks()
        
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
    
    // We got rid of the following code so that our list is not prepopulated
    
    /*func makeTasks() -> [Task] {
        
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        let task2 = Task()
        task2.name = "Buy cheese"
        task2.important = true
        let task3 = Task()
        task3.name = "Mow the lawn"
        task3.important = false
        
        return [task1,task2,task3]
        
    }*/
    
    // When creating a button, be sure to label a SPECIFC action (note 'plusTapped'), and link the segue right in the button tap action with performSegue
    @IBAction func plusTapped(_ sender: Any) {
        
        // 'nil' means nothing
        // For the withIdentifier section, go back to Storyboard and click on the seque between the two boards. In the right hand side under the Storyboard Segue section, there is an identifier section. Name it, and once you do, you insert the identifier into the following segue code. This allows the app to PERFORM a SEGUE with the specific IDENTIFIER or LOCATION
        
        // Basically, when tapped, perform segue to...
        
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    // Before we move around, reference back to each other
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // For multiple segues, use IF statement
        // Do not need: Core Data related
        /*if segue.identifier == "addSegue" {
            
            let nextVC = segue.destination as! CreateTaskViewController
            
            // Sets 'previousVC' in nextVC (CreateTaskViewController as declared above) equal to this View Controller
            // Do not need: Core Data Related
            // nextVC.previousVC = self
        }*/
        
        if segue.identifier == "selectTaskSegue" {
         
            let nextVC = segue.destination as! CompleteTaskViewController
            
            nextVC.task = sender as! Task
            
            nextVC.previousVC = self
            
        }
    }
    
}

