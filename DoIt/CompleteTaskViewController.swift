//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Brandon Viertel on 4/12/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    // Variable 'task' holds Optional Task as 'nil'
    
    var task : Task? = nil
    
    // Variable label to change to whatever 'task' has been selected from the Main View Controller
    
    @IBOutlet weak var completeTaskLabel: UILabel!
    
    @IBOutlet weak var completeTaskDesc: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Add exclamation point to the beginning of 'tasks' with a 'true' important value
        
        if task!.important {
            
            completeTaskLabel.text = "❗️ \(task!.name!)"
            
        } else {
            
            completeTaskLabel.text = task!.name!
            
        }
        
        completeTaskDesc.text = task!.desc!

    }
    
    // When Complete Button is Tapped
    
    @IBAction func CompleteTapped(_ sender: Any) {
        
        // Get Context (Task)
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Delete Context (Task)
        
        context.delete(task!)
        
        // Save Context (Know that delete happened)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Pop back to Table View
        
        navigationController?.popViewController(animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
