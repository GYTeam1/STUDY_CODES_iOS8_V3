//
//  ToDoListTableViewController.swift
//  ToDoList-Swift


import UIKit

class ToDoListTableViewController: UITableViewController {
    var toDoItems: ToDoItem[] = ToDoItem[]()
    
    func loadInitialData() {
        var item1 = ToDoItem()
        item1.itemName = "Buy milk"
        toDoItems += item1
        var item2 = ToDoItem()
        item2.itemName = "Buy eggs"
        toDoItems += item2
        var item3 = ToDoItem()
        item3.itemName = "Read a book"
        toDoItems += item3
    }
    
    @IBAction func unwindToList(sender: UIStoryboardSegue!){
        let source = sender.sourceViewController as AddToDoItemViewController
        var item = source.toDoItem
        if item {
            toDoItems += item
            tableView.reloadData()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 告诉表格视图要显示几个部分，对于此应用程序，表格视图只需要显示一个部分，所以实现比较简单
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    // 返回表格中的行数
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    // 让数据源为给定行配置单元格
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cellIdentifier = "ListPrototypeCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell!
        var toDoItem = toDoItems[indexPath!.row]
        cell.textLabel.text = toDoItem.itemName
        if toDoItem.completed {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var tappedItem = toDoItems[indexPath.row]
        tappedItem.completed = !tappedItem.completed
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }
}
