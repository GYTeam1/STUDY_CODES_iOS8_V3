//
//  DetailViewController.swift
//  TSwift


import UIKit

class DetailViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    override func viewDidLoad()
    {
        self.view!.backgroundColor = UIColor.whiteColor()
        
        if self.title == "UIToolbar"
        {
            var toolBar = UIToolbar(frame:CGRectMake(60.0, 120.0, 200.0, 30.0))

            var flexibleSpace = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FlexibleSpace, target:nil, action:nil)
            var barBtnItemA = UIBarButtonItem(title: "A", style:UIBarButtonItemStyle.Plain, target:nil, action:nil)
            var barBtnItemB = UIBarButtonItem(title: "B", style:UIBarButtonItemStyle.Plain, target:nil, action:nil)
            var barBtnItemC = UIBarButtonItem(title: "C", style:UIBarButtonItemStyle.Plain, target:nil, action:nil)
            var barBtnItemD = UIBarButtonItem(title: "D", style:UIBarButtonItemStyle.Plain, target:nil, action:nil)
            
            toolBar.items = [flexibleSpace, barBtnItemA, flexibleSpace, barBtnItemB, flexibleSpace, barBtnItemC, flexibleSpace, barBtnItemD, flexibleSpace]
            self.view.addSubview(toolBar)
        }
        else
        {}
    }
    
    override func viewWillAppear(animated: Bool) {}
    override func viewDidAppear(animated: Bool) {}
    override func viewWillDisappear(animated: Bool) {}
    override func viewDidDisappear(animated: Bool) {}
    
    // Button Action
    func buttonAction(sender: UIButton)
    {
        var mathSum = MathSum()
        var sum = mathSum.sum(11, number2: 22)
        
        var alert = UIAlertController(title: "Title", message: String(format: "Result = %i", sum), preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        /*
        var alertView = UIAlertView()
        alertView.title = "Title"
        alertView.message = "Message"
        alertView.addButtonWithTitle("OK")
        alertView.show()
        */

    }
    
    // UIPickerViewDataSource Methods
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int
    {
        return 3
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int
    {
        return 10
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return String(format:"%i", row)
    }
    
    // Button Handler
    // showActionSheet
    func showActionSheet()
    {
        var alertController = UIAlertController(title: "ActionSheet", message: "Message", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alertController.addAction(UIAlertAction(title: "Go Back", style: UIAlertActionStyle.Destructive, handler: nil))
        self.presentViewController(alertController, animated: true, completion:nil)
    }
    
    // didReceiveMemoryWarning
    override func didReceiveMemoryWarning()
    {}
}
