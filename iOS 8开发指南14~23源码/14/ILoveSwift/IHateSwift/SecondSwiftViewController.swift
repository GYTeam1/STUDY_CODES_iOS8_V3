//
//  SecondSwiftViewController.swift
//  IHateSwift


import UIKit

class SecondSwiftViewController: UIViewController {

    @IBOutlet var topMessageLabel : UILabel = nil
    @IBOutlet var questionLabel : UILabel = nil
    @IBOutlet var factButton : UIButton = nil
    
    var titleInteger: NSInteger = 0
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(coder aDecoder: NSCoder!)  {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(titleInteger)"
        
        topMessageLabel.textColor = UIColor.redColor()
        
        questionLabel.textAlignment = .Center
        questionLabel.text = "我不喜欢SWIFT!!"
        
        factButton.setTitle("In Fact....", forState: .Normal)
        factButton.titleLabel.textAlignment = .Center
    }

    @IBAction func showTheFact(sender : AnyObject) {
        
        factButton.enabled = false
        factButton.setTitle("我的实话", forState: .Normal)
        
        questionLabel.text = "我非常喜欢SWIFT!!"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
