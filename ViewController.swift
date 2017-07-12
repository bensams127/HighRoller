//
//  ViewController.swift
//  HighRoller
//
//  Created by Sams on 6/2/17.
//  Copyright © 2017 Sams. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class ViewController: UIViewController, AVAudioPlayerDelegate, GADBannerViewDelegate {
   
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var myBanner: GADBannerView!
    
    var audioPlayer : AVAudioPlayer!
    
    var diceRoll1: Int = 1
    
    var diceRoll2: Int = 1
    
    var diceRollSingle: Int = 1
    
    var diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
   
    var soundToggle: Bool = true
    
    @IBOutlet weak var diceImageLeft: UIImageView!
    @IBOutlet weak var diceImageRight: UIImageView!
    
    @IBOutlet weak var diceImageSingle: UIImageView!
    
    @IBOutlet weak var singleMiddleview: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //test device
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        //setup Ad
        myBanner.adUnitID = "ca-app-pub-1854353963587972/4221094047"
        
        myBanner.rootViewController = self
        myBanner.delegate = self
        
        myBanner.load(request)
        
        updateDiceImages()
        
    
        
    }
    
    @IBAction func rollButton(_ sender: Any) {
        
        updateDiceImages()
        
        if soundToggle == true {
        
        soundQuestion()
        } else {
            return
        }
    }
    
    func updateDiceImages() {
        
        diceRoll1 = Int(arc4random_uniform(6))
        diceRoll2 = Int(arc4random_uniform(6))
        diceRollSingle = Int(arc4random_uniform(6))
        
        diceImageLeft.image = UIImage(named: diceArray[diceRoll1])
        diceImageRight.image = UIImage(named: diceArray[diceRoll2])
        diceImageSingle.image = UIImage(named: diceArray[diceRollSingle])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages()
        
        if soundToggle == true {
            
            soundQuestion()
        } else {
            return
        }

    }
    
    
    func playSound(soundFileName : String) {
        
            let soundURL1 = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL1!)
        }
        catch  {
            print(error)
        }
        
        audioPlayer.play()
        
    }
    
    func soundQuestion(){
    
        
        if diceRoll1 == 0 && diceRoll2 == 0 && singleMiddleview.isHidden == true {
            
            playSound(soundFileName: "snakeeyes")
            
        } else {
            playSound(soundFileName: "diceroll")
        }
        
    }
    
    
    @IBAction func settingsButtonPushed(_ sender: Any) {
        
            self.settingsView.isHidden = false
     
            UIView.animate(withDuration: 0.15) { () -> Void in
            self.settingsView.alpha = 1
        }

    }

   
    @IBAction func okButtonPressed(_ sender: Any) {
       
   
        UIView.animate(withDuration: 0.15) { () -> Void in
        self.settingsView.alpha = 0
            
            let when = DispatchTime.now() + 1 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.settingsView.isHidden = true
            }
            
        }
        
    }
    
    @IBAction func soundSwitch(_ sender: UISwitch) {
        
        if sender.isOn == false {
            
            soundToggle = false
            
        } else {
            
            soundToggle = true
           
            }

    }
    
    @IBAction func diceNumberSelection(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex {
            case 0: singleMiddleview.isHidden = false
            case 1: singleMiddleview.isHidden = true
            default: break
        }
    }

}
