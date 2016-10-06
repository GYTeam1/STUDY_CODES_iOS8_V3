//
//  TableViewController.swift
//  MixMusic


import UIKit

class TableViewController: UITableViewController {
    
    var musicPaths = NSMutableArray()
    
    override func viewDidLoad() {
        let path = "/Users/guanxijing/Desktop/musics"
        let fileManager = NSFileManager.defaultManager()
        let fileNames = fileManager.contentsOfDirectoryAtPath(path, error: nil)
        for fileName: AnyObject in fileNames {
            if fileName.hasSuffix("mp3") {
                let musicPath = path.stringByAppendingPathComponent(fileName as NSString)
                musicPaths.addObject(musicPath)
            }
        }
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.musicPaths.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let path = self.musicPaths[indexPath.row] as String
        cell.textLabel.text = path.lastPathComponent
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let path = self.musicPaths[indexPath.row] as String
        self.performSegueWithIdentifier("playMusicVC", sender: path)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        let playMusicVC = segue.destinationViewController as ViewController
        playMusicVC.musicPaths = self.musicPaths
        playMusicVC.currentIndex = self.musicPaths.indexOfObject(sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


