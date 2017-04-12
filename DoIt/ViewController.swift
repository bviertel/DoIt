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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Where does it get it's data from
        tableView.dataSource = self
        
        tableView.delegate = self
        
    }
    
    // Number of rows in Table, 'numberOfRowsInSection'
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    // Information in cells, 'cellForRowAt'
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // New Constant 'cell' of class 'UITableViewCell'
        let cell = UITableViewCell()
        
        // Sets value of all cells to 'Hello'
        cell.textLabel!.text = "Hello"
        
        // Returns the constant 'cell'
        return cell
    
    }

}

