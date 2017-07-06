//
//  ContainerVC2.swift
//  HighRoller
//
//  Created by Sams on 7/6/17.
//  Copyright © 2017 Sams. All rights reserved.
//

import UIKit
import AVFoundation

class ContainerVC2: UIViewController {
    
    
    var audioPlayer : AVAudioPlayer!
    
    var diceRoll1: Int = 1
    
    var diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
  
    
    
    @IBOutlet weak var diceImageLeft: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        updateDiceImages()
        
    }
    
    @IBAction func rollButton(_ sender: Any) {
        
        updateDiceImages()
        
        soundQuestion()
        
    }
    
    func updateDiceImages() {
        
        diceRoll1 = Int(arc4random_uniform(6))
        //    diceRoll2 = Int(arc4random_uniform(6))
        
        diceImageLeft.image = UIImage(named: diceArray[diceRoll1])
        //    diceImageRight.image = UIImage(named: diceArray[diceRoll2])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages()
        soundQuestion()
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
        //        if diceRoll1 == 0 && diceRoll2 == 0 {
        //
        //            playSound(soundFileName: "snakeeyes")
        //
        //        } else {
        playSound(soundFileName: "diceroll")
    }
    
    
    
}

