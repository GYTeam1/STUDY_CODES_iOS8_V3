//
//  MainTableViewController.swift
//  HackerNews


import Foundation
import UIKit

class MainTableViewController: UITableViewController, UITableViewDataSource {
    
    // MARK: 定义三个常量属性
    
    let hackerNewsApiUrl = "http://hn.amitburst.me/news"
    let storyCellIdentifier = "StoryCell"
    let showBrowserIdentifier = "ShowBrowser"
    var stories = []
    
    // MARK: 页面载入的生命周期
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRefreshControl()
        fetchStories()
    }
    
    // MARK: 构造新闻结构
    
    func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "fetchStories", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        self.refreshControl = refreshControl
    }
    
    // MARK: 获取远程站点的新闻信息
    
    func fetchStories() {
        let url = NSURL.URLWithString(hackerNewsApiUrl)
        let request = NSURLRequest(URL: url)
        let queue = NSOperationQueue()
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true;
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler: { response, data, error in
            if error {
                println(error)
                self.refreshControl.endRefreshing()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            } else {
                let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
                self.stories = json["posts"] as NSArray
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Fade)
                    self.refreshControl.endRefreshing()
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                })
            }
        })
    }
    
    // MARK: U设置TableView控件显示的新闻资源
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier(storyCellIdentifier) as UITableViewCell
        
        let story = stories[indexPath.row] as NSDictionary
        let user = story["user"] as NSDictionary
        
        let title = story["title"] as String
        let points = story["points"] as Int
        let username = user["username"] as String
        
        cell.textLabel.text = title
        cell.detailTextLabel.text = "\(points) points by \(username)"
        
        return cell
    }
    
    // MARK: UIViewController
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == showBrowserIdentifier {
            let webView = segue.destinationViewController as BrowserViewController
            let cell = sender as UITableViewCell
            let row = tableView.indexPathForCell(cell).row
            let story = stories[row] as NSDictionary
            
            webView.title = story["title"] as String
            webView.storyTitle = webView.title
            webView.urlToLoad = story["url"] as String
        }
    }
    
}
