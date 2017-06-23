//
//  InterfaceController.swift
//  HighRoller WatchKit Extension
//
//  Created by Sams on 6/19/17.
//  Copyright © 2017 Sams. All rights reserved.
//

import WatchKit
import Foundation
import UIKit



class InterfaceController: WKInterfaceController {

    
    @IBOutlet var leftWatchDice: WKInterfaceImage!
    
    @IBOutlet var rightWatchDice: WKInterfaceImage!
    
    var diceRoll1: Int = 1
    var diceRoll2: Int = 1
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
       
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func rollButtonPushed() {
        
        updateDiceImages()
        
        WKInterfaceDevice.current().play(.notification)
        
    }
    func updateDiceImages() {
        
        diceRoll1 = Int(arc4random_uniform(6))
        diceRoll2 = Int(arc4random_uniform(6))
        
       
        if diceRoll1 == 0 {
            leftWatchDice.setImage(#imageLiteral(resourceName: "dice1watch"))
        } else if diceRoll1 == 1 {
            leftWatchDice.setImage(#imageLiteral(resourceName: "dice2watch"))
        } else if diceRoll1 == 2 {
            leftWatchDice.setImage(#imageLiteral(resourceName: "dice3watch"))
        } else if diceRoll1 == 3 {
            leftWatchDice.setImage(#imageLiteral(resourceName: "dice4watch"))
        } else if diceRoll1 == 4 {
            leftWatchDice.setImage(#imageLiteral(resourceName: "dice5watch"))
        } else if diceRoll1 == 5 {
            leftWatchDice.setImage(#imageLiteral(resourceName: "dice6watch"))
        } else {
            return
        }
    
        if diceRoll2 == 0 {
            rightWatchDice.setImage(#imageLiteral(resourceName: "dice1watch"))
        } else if diceRoll2 == 1 {
            rightWatchDice.setImage(#imageLiteral(resourceName: "dice2watch"))
        } else if diceRoll2 == 2 {
            rightWatchDice.setImage(#imageLiteral(resourceName: "dice3watch"))
        } else if diceRoll2 == 3 {
            rightWatchDice.setImage(#imageLiteral(resourceName: "dice4watch"))
        } else if diceRoll2 == 4 {
            rightWatchDice.setImage(#imageLiteral(resourceName: "dice5watch"))
        } else if diceRoll2 == 5 {
            rightWatchDice.setImage(#imageLiteral(resourceName: "dice6watch"))
        } else {
            return
        }
    }

}
