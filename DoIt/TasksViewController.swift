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

    // Link to the Table View
    
    @IBOutlet weak var tableView: UITableView!
    
    // Holds all of the added and pre-existing tasks
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Where does it get it's data from
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
    }
    
    // Called everytime view controller is about to show (First start, going back to, etc)
    
    override func viewWillAppear(_ animated: Bool) {
        
        getTasks()
        
        // Reloads the TableView to immediately show data that was recently entered
        
        tableView.reloadData()
    }
    
    // Number of rows in Table, 'numberOfRowsInSection'. Gets the number of rows from the amount of array items (tasks)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        // Number of rows from the count of array items (tasks)

        return tasks.count
        
    }
    
    // Information in cells, 'cellForRowAt'
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // New Constant 'cell' of class 'UITableViewCell'
        
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        // If the task.important value is true, add exclamation points to beginning
        
        if task.important {
            
            cell.textLabel!.text = "❗️ \(task.name!)"
            
        } else {
            
            cell.textLabel!.text = task.name!
            
        }
        
        return cell
        
    }
    
    // Segue based on row selection
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTaskSegue" , sender: task)
        
    }
    
    // When creating a button, be sure to label a SPECIFC action (note 'plusTapped'), and link the segue right in the button tap action with performSegue
    @IBAction func plusTapped(_ sender: Any) {
        
        // For the withIdentifier section, go back to Storyboard and click on the seque between the two boards. In the right hand side under the Storyboard Segue section, there is an identifier section. Name it, and once you do, you insert the identifier into the following segue code. This allows the app to PERFORM a SEGUE with the specific IDENTIFIER or LOCATION
        
        // Perform Segue to ----> 'addSegue' e.g.
        
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    // Retrieving Core Data using MSFetch. Pulling from Core Data
    
    func getTasks() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // 'Do' each of the 'try's, and 'catch' error if thrown
        
        do {
        
            // Fetches the task, gives back array of Task object
            
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            
            print(tasks)
        
        } catch {
            
            print("ERROR")
            
        }
    }
    
    // Prepares for ALL segues from view controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // For multiple segues, use IF statement

        if segue.identifier == "selectTaskSegue" {
         
            let nextVC = segue.destination as! CompleteTaskViewController
            
            nextVC.task = sender as? Task
            
        }
    }
    
}

