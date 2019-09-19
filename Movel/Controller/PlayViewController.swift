//
//  PlayViewController.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit
import CoreMotion

class PlayViewController: UIViewController {

    let playView = PlayView()
    var preference:Preference!
    var timer:Timer!
    var countdownDuration:Int = 3
    var duration:Float = 10
    var steps:Int = 0
    var requiredSteps:Int = 0
    var healthData:HealthData = HealthData()
    var pedoMeter = CMPedometer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefault = UserDefaults.standard
        
        if (userDefault.float(forKey: "duration") != 0) && (userDefault.string(forKey: "intensity") != nil) {
            let intensity = userDefault.string(forKey: "intensity")!
            let duration = userDefault.float(forKey: "duration")
            preference = Preference(intensity: intensity, duration: duration)
        }
        else {
            preference = Preference(intensity: "Easy", duration: 1)
        }
        
        self.healthData.readSteps()
        
        self.view = playView
        
        duration = preference.duration
        playView.countdownLabel.text = "Ready?"
        
        countdown()
        
    }
    
    func startPedo() {
        if CMPedometer.isPedometerEventTrackingAvailable() {
            pedoMeter.startUpdates(from: Date()) { (pData, pError) in
                if let data = pData {
                    self.steps = Int(data.numberOfSteps)
                    var total = self.requiredSteps - self.steps
                    if self.requiredSteps - self.steps >= 0 {
                        DispatchQueue.global().async {
                            DispatchQueue.main.async {
                                self.playView.countdownLabel.text = String("\(total) Steps")
                            }
                        }
                    }
                    else {
                        DispatchQueue.global().async {
                            DispatchQueue.main.async {
                                total = 0
                                self.playView.countdownLabel.text = String("\(total) Steps")
                            }
                        }                    }
                    
                    print(data.numberOfSteps)
                }
            }
        }
    }
    
    func countdown() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(readyCountdown), userInfo: nil, repeats: true)
    }
    
    func playGame() {
        playView.runLabel.isHidden = false
        let challenge = Challenge(duration: preference.duration, intensity: preference.intensity)
        startPedo()
        playView.timer.isHidden = false
        requiredSteps = challenge.createChallenge()
        playView.countdownLabel.text = String("\(requiredSteps) Steps")
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
            pedoMeter.stopUpdates()
            checkWinCondition()
        }
    }
    
    func checkWinCondition() {
        print("\(steps) OLD")
        print("\(requiredSteps) NEW")
        playView.runLabel.isHidden = true
        if steps < requiredSteps {
            failCondition()
        }
        else {
            winCondition()
        }
        playView.instruction.isHidden = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapScreen))
        playView.addGestureRecognizer(tap)
        
    }
    
    @objc func tapScreen() {
        let finishViewController = FinishViewController()
        var total = 100 * (steps * 1/requiredSteps)
        
        finishViewController.score = total
        finishViewController.steps = steps
        self.present(finishViewController,animated: true)
    }
    func failCondition() {
        UIView.animate(withDuration: 0.3) {
            self.playView.backgroundColor = failColor
            self.playView.countdownLabel.text = "LOSE"
            self.playView.timer.isHidden = true
        }
    }
    
    func winCondition() {
        UIView.animate(withDuration: 0.3) {
            self.playView.backgroundColor = successColor
            self.playView.countdownLabel.text = "WIN"
            self.playView.timer.isHidden = true
        }
    }
}
