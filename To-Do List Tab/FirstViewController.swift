//
//  FirstViewController.swift
//  To-Do List Tab
//
//  Created by Pansit Wattana on 2/1/17.
//  Copyright © 2017 Pansit Wattana. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var toDoList = [String]()
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loadToDoList = UserDefaults.standard.object(forKey: "todolist")
        
        if let array = loadToDoList as? NSArray {
            toDoList = array as! [String]
        
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        let loadToDoList = UserDefaults.standard.object(forKey: "todolist")
        
        if let array = loadToDoList as? NSArray {
            toDoList = array as! [String]
            
        }
        print(toDoList)
        table.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")

        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            toDoList.remove(at: indexPath.row)
            
            table.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            UserDefaults.standard.set(toDoList, forKey: "todolist")
        }
    }
    
    public func AddToDo(toDo :String) -> Void {
        toDoList.append(toDo)
        UserDefaults.standard.set(toDoList, forKey: "todolist")
    }
}

