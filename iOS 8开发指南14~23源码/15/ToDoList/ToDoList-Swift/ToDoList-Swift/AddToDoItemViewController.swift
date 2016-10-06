//
//  AddToDoItemViewController.swift
//  ToDoList-Swift


import UIKit

class AddToDoItemViewController: UIViewController {
    @IBOutlet var textField : UITextField
    @IBOutlet var doneButton : UIBarButtonItem
    
    var toDoItem : ToDoItem!
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if sender as UIBarButtonItem != doneButton {
            return
        }
        if textField.text != "" {
            toDoItem = ToDoItem()
            toDoItem.itemName = textField.text
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
