//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {
                            
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func startGameButtonTapped(sender : UIButton) {
    let game = NumberTileGameViewController(dimension: 4, threshold: 2048)
    self.presentViewController(game, animated: true, completion: nil)
  }
}

