//
//  ViewController.swift
//  DoIt
//
//  Created by Ann Marie Seyerlein on 4/11/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

// Inserted UITableViewDelegate and UITableViewDataSource
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Table View Variable
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Do this before dataSource and Delegate
        tasks = makeTasks()
        
        // Where does it get it's data from
        tableView.dataSource = self
        
        tableView.delegate = self
        
    }
    
    // Number of rows in Table, 'numberOfRowsInSection'
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
    
    func makeTasks() -> [Task] {
        
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
        
    }
    
    // When creating a button, be sure to label a SPECIFC action (note 'plusTapped'), and link the segue right in the button tap action with performSegue
    @IBAction func plusTapped(_ sender: Any) {
        
        // 'nil' means nothing
        // For the withIdentifier section, go back to Storyboard and click on the seque between the two boards. In the right hand side under the Storyboard Segue section, there is an identifier section. Name it, and once you do, you insert the identifier into the following segue code. This allows the app to PERFORM a SEGUE with the specific IDENTIFIER or LOCATION
        
        // Basically, when tapped, perform segue to...
        
        performSegue(withIdentifier: "addSegue", sender: nil)
    
    }

}

