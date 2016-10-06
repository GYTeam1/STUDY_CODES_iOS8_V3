//
//  ToDoItem.swift
//  ToDoList-Swift


import UIKit

class ToDoItem: NSObject {
    
    init(){
        completed = false
        creationDate = NSDate.date()
    }
    
    var itemName:String?
    var completed:Bool
    var creationDate:NSDate
   
}
