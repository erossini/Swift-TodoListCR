//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Enrico Rossini on 17/08/2021.
//

import UIKit

class AddToDoViewController: UIViewController {
    var todoTableViewController: ToDoTableViewController?=nil

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let newToDo = ToDo()
        newToDo.priority = prioritySegment.selectedSegmentIndex
        if let name = nameTextField.text {
            newToDo.name = name
        }
        
        todoTableViewController?.todos.append(newToDo)
        todoTableViewController?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
