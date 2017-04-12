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

}

