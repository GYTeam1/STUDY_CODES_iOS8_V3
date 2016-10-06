//
//  FirstSwiftTableViewController.swift
//  IHateSwift
//

import UIKit

class FirstSwiftTableViewController: UITableViewController {

    init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    init(coder aDecoder: NSCoder!)  {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "第一个View Controller"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("justCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel.text = "Current Row Is  \(indexPath.row)"
        
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
        
        let nextView = self.storyboard.instantiateViewControllerWithIdentifier("SecondSwiftView") as SecondSwiftViewController
        nextView.titleInteger = indexPath.row
        self.navigationController.pushViewController(nextView, animated: true)
    }

}
