//
//  ViewController.swift
//  MixMusic


import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var musicPaths = NSMutableArray()
    var musicPath: String!
    var currentIndex = 0
    
    @IBOutlet var allTimeLabel : UILabel
    @IBOutlet var currentTimeLabel : UILabel
    @IBOutlet var musicSlider : UISlider
    
    
    var timer: NSTimer!
    weak var app: AppDelegate!
    
    
    override func viewDidDisappear(animated: Bool) {
        self.timer.invalidate()
        super.viewDidDisappear(animated)
    }
    
    override func viewDidLoad() {
        self.app = UIApplication.sharedApplication().delegate as AppDelegate
        super.viewDidLoad()
        
        playMusic()
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateUI", userInfo: nil, repeats:true)
    }
    
    func playMusic() {
        if self.currentIndex == self.musicPaths.count {
            self.currentIndex = 0
        } else if self.currentIndex == -1 {
            self.currentIndex = self.musicPaths.count - 1
        }
        
        self.musicPath = self.musicPaths[self.currentIndex] as String
        
        self.title = self.musicPath.lastPathComponent
        
        //创建一个本地URL
        let musicURL = NSURL.fileURLWithPath(self.musicPath)
        let currentMusicPath = self.app.musicPlayer?.url.path
        
        //如果即将播放的和正在播放的是同一首 就什么都不做
        if !(currentMusicPath == self.musicPath) {
            self.app.musicPlayer = AVAudioPlayer(contentsOfURL:musicURL, error: nil)
            self.app.musicPlayer!.delegate = self
        }
        self.app.musicPlayer!.play()
        
        //设置slider的最大值 为歌曲长度
        self.musicSlider.maximumValue = CFloat(self.app.musicPlayer!.duration)
        self.allTimeLabel.text = "\(Int(self.app.musicPlayer!.duration/60)):\(Int(self.app.musicPlayer!.duration%60))"
    }
    
    func updateUI() {
        self.currentTimeLabel.text = "\(Int(self.app.musicPlayer!.currentTime/60)):\(Int(self.app.musicPlayer!.currentTime%60))"
        self.musicSlider.value = CFloat(self.app.musicPlayer!.currentTime)
    }
    
    @IBAction func valueChangeAction(sender : UISlider) {
        self.app.musicPlayer!.currentTime = NSTimeInterval(sender.value)
    }
    
    @IBAction func clickButton(sender : UIButton) {
        switch sender.tag {
        case 0:
            self.currentIndex--
            playMusic()
        case 1:
            if self.app.musicPlayer?.playing {
                self.app.musicPlayer?.pause()
                sender.setTitle("播放", forState: UIControlState.Normal)
            } else {
                self.app.musicPlayer?.play()
                sender.setTitle("暂停", forState: UIControlState.Normal)
            }
        case 2:
            self.currentIndex++
            playMusic()
        default:
            break
        }
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        self.currentIndex++
        playMusic()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

