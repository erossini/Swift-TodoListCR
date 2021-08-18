//
//  ToDoDetailsViewController.swift
//  ToDoList
//
//  Created by Enrico Rossini on 17/08/2021.
//

import UIKit

class ToDoDetailsViewController: UIViewController {

    var todo = ToDo()
    @IBOutlet weak var todoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if todo.priority == 1 {
            todoLabel.text = "❗️" + todo.name
        }
        else if todo.priority == 2 {
            todoLabel.text = "‼️" + todo.name
        }
        else {
            todoLabel.text = todo.name
        }
    }
    
    @IBAction func doneTapped(_ sender: Any) {
    }
}
