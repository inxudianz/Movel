//
//  PlayViewController.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    let playView = PlayView()
    var preference:Preference!
    var timer:Timer!
    var countdownDuration:Int = 3
    var duration:Float = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefault = UserDefaults.standard
        
        if (userDefault.float(forKey: "duration") != nil) && (userDefault.string(forKey: "intensity") != nil) {
            let intensity = userDefault.string(forKey: "intensity")!
            let duration = userDefault.float(forKey: "duration")
            preference = Preference(intensity: intensity, duration: duration)
        }
        else {
            preference = Preference(intensity: "Easy", duration: 1)
        }

        self.view = playView
        
        duration = preference.duration
        playView.countdownLabel.text = "Ready?"
        
        countdown()
        
    }
    
    func countdown() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(readyCountdown), userInfo: nil, repeats: true)
    }
    
    func playGame() {
        let challenge = Challenge(duration: preference.duration, intensity: preference.intensity)
        playView.timer.isHidden = false
        playView.countdownLabel.text = String("\(challenge.createChallenge()) Steps")
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timeLimitCountdown), userInfo: nil, repeats: true)
    }
    
    @objc func readyCountdown() {
        
        playView.countdownLabel.text = String(countdownDuration)
        countdownDuration -= 1
        
        if countdownDuration < 0 {
            print("Finished")
            timer.invalidate()
            
            playGame()
        }
    }
    
    @objc func timeLimitCountdown() {
        
        playView.timer.text = String(format: "%.1f", duration)
        
        duration -= 0.1
        if duration <= 0 {
            print("Finished")
            timer.invalidate()
        }
        
    }
}
