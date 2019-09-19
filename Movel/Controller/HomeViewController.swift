//
//  HomeViewController.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit
import HealthKit
import LocalAuthentication

class HomeViewController: UIViewController {
    
    let health = HealthData()
    let homeView = HomeView()
    var isValidated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        let score = Score()
        print(score.calculateScore(steps: 20, required: 22))
        createRightBarItem()
        
        self.view = homeView
        
        homeView.playButton.addTarget(self, action: #selector(play(sender:)), for: .touchDown)
    }
    
    func createRightBarItem() {
        let settingMenu = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(openPreference))
        settingMenu.imageInsets.right = CGFloat(-30)
        settingMenu.imageInsets.left = CGFloat(100)
        navigationItem.rightBarButtonItem = settingMenu
    }

    override func viewDidAppear(_ animated: Bool) {
        let userDefault = UserDefaults.standard
        if userDefault.integer(forKey: "score") != nil {
            homeView.topScore.text = String(userDefault.integer(forKey: "score"))
        }
        else {
            homeView.topScore.text = "0"
        }
    }
    
    @objc func play(sender: UIButton!) {
        
        sender.layer.opacity = 0.7
        UIView.animate(withDuration: 0.2) {
            sender.layer.opacity = 1
        }
        
        validateUser()
    }
    
    func validated() {
        if isValidated {
            let tutorialViewController = TutorialViewController()
            self.present(tutorialViewController, animated: true, completion: nil)
        }
        else {
            print("You are not validated")
            return
        }
    }
    
    @objc func openPreference() {
        let preferenceViewController = PreferenceViewController()
        self.navigationController?.pushViewController(preferenceViewController, animated: true)
    }
    
    func validateUser() {
        let context:LAContext = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We want to confirm your identity with Face ID") { (wasCorrect, error) in
                if wasCorrect {
                    self.isValidated = true
                    DispatchQueue.global().async {
                        DispatchQueue.main.async {
                            self.validated()
                        }
                    }
                    print("Success")
                }
                else {
                    self.isValidated = false
                    print("Failed")
                }
            }
        }
        else {
            let alert = UIAlertController(title: "Not Available", message: "Your device is not supported with Face ID", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        }
    }

}
