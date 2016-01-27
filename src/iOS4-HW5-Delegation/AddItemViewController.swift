//
//  AddItemViewController.swift
//  iOS4-HW5-Delegation
//
//  Created by Kathryn Rotondo on 1/20/16.
//  Copyright © 2016 Kathryn Rotondo. All rights reserved.
//

import UIKit

//1. Add a protocol inside AddItemViewController that outlines the job of saving new data.
protocol ToDoSaver {
    func saveTodo(todo:Todo)
}

class AddItemViewController: UIViewController {
//2. Add a variable inside AddItemViewController to hold a reference to the class that will be doing the delegated work.
    var delegate:ToDoSaver?
    @IBOutlet weak var itemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//3. Call the function on the delegate at the appropriate point in AddItemViewController
    @IBAction func saveButtonPressed(sender: AnyObject) {
        if let title = itemTextField.text {
            let todo = Todo()
            todo.title = title
            delegate?.saveTodo(todo)
            
            
            
//7. Finally, in AddItemViewController, remember to pop the current view controller from the navigationController's stack when it is no longer needed.
            navigationController?.popViewControllerAnimated(true)
    }
  }
}