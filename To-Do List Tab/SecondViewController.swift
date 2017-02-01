//
//  SecondViewController.swift
//  To-Do List Tab
//
//  Created by Pansit Wattana on 2/1/17.
//  Copyright © 2017 Pansit Wattana. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let todo = inputText.text
        
        if segue.identifier == "onButtonConfirm" {
            if let destination = segue.destination as? FirstViewController {
                destination.AddToDo(toDo: todo!)
            }
        }
    }

    @IBAction func onConfirm(_ sender: Any) {
        let todo = inputText.text
        
        let toDoList = UserDefaults.standard.object(forKey: "todolist")
        
        var newToDoList = [String]()
        
        if let list = toDoList as? NSArray {
            newToDoList = list as! [String]
            newToDoList.append(todo!)
            UserDefaults.standard.set(newToDoList, forKey: "todolist")
        }
        
    }
}

