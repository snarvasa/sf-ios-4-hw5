//
//  ItemsTableViewController.swift
//  iOS4-HW5-Delegation
//
//  Created by Kathryn Rotondo on 1/20/16.
//  Copyright © 2016 Kathryn Rotondo. All rights reserved.
//

import UIKit

//4.Adopt the protocol in ItemsTableViewController.
class ItemsTableViewController: UITableViewController, ToDoSaver {

    var items:[Todo] = []
    
    @IBAction func didTapAddButton(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    
/* 5. Conform to the protocol in ItemsTableViewController. You will need to add the new item to the array of items that powers the table
view, and remember to reload the table view so that it refreshes to show the new data.
*/
    func saveTodo(todo: Todo) {
        
        items.append(todo)
        tableView.reloadData()
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCellIdentifier", forIndexPath: indexPath)
        let todo = items[indexPath.row]
        
        cell.textLabel?.text = todo.title
        
        
        return cell
    }

    
    // MARK: - Navigation

//6. In ItemsTableViewController's prepareForSegue method, pass a reference of self to the destination view controller.
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let addTodoViewController = segue.destinationViewController as! AddItemViewController
        
        addTodoViewController.delegate = self
    }
    

}
