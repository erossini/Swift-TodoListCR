//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Enrico Rossini on 17/08/2021.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var todoCDs: [ToDoCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDosFromCoreData = try? context.fetch(ToDoCD.fetchRequest()) {
                if let toDos = toDosFromCoreData as? [ToDoCD] {
                    todoCDs = toDos
                    tableView.reloadData()
                }
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoCDs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let selectedToDo = todoCDs[indexPath.row]
        
        if selectedToDo.priority == 1 {
            if let name = selectedToDo.name {
                cell.textLabel?.text = "❗️" + name
            }
        }
        else if selectedToDo.priority == 2 {
            if let name = selectedToDo.name {
                cell.textLabel?.text = "‼️" + name
            }
        }
        else {
            cell.textLabel?.text = selectedToDo.name
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = todoCDs[indexPath.row]
        performSegue(withIdentifier: "moveToDetails", sender: selectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addToDoViewController = segue.destination as? AddToDoViewController {
            addToDoViewController.todoTableViewController = self
        }
        
        if let detailsViewController = segue.destination as? ToDoDetailsViewController {
            if let selectedToDo = sender as? ToDo {
                detailsViewController.todo = selectedToDo
            }
        }
    }
}
