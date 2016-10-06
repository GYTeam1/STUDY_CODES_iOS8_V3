//
//  BrowserViewController.swift
//  HackerNews

//
//  Abstract:
//      载入显示某条新闻的详细信息.
//

import Foundation
import UIKit

class BrowserViewController : UIViewController, UIWebViewDelegate {
    
    // MARK: Properties
    
    @IBOutlet var webView: UIWebView
    @IBOutlet var activityIndicator: UIActivityIndicatorView
    var urlToLoad = ""
    var storyTitle = ""
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        loadUrl()
    }
    
    // MARK: Page Loading
    
    func loadUrl() {
        let url = NSURL(string: urlToLoad)
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
    
    // MARK: IBActions
    
    @IBAction func showSharingOptions(sender : AnyObject) {
        let activityViewController = UIActivityViewController(activityItems: [storyTitle, urlToLoad], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityTypeAssignToContact, UIActivityTypePostToFlickr, UIActivityTypePostToVimeo, UIActivityTypePrint, UIActivityTypeSaveToCameraRoll]
        navigationController.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: UIWebViewDelegate
    
    func webViewDidStartLoad(webView: UIWebView) {
        activityIndicator.startAnimating()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
}