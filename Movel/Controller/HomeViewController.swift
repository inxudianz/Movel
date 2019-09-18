//
//  HomeViewController.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit
import HealthKit

class HomeViewController: UIViewController {
    
    let health = HealthData()
    let homeView = HomeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(openPreference))
        
        self.view = homeView
        
        homeView.playButton.addTarget(self, action: #selector(play), for: .touchDown)
        
        DispatchQueue.global().async {
            self.health.readSteps()
            DispatchQueue.main.async {
                self.health.getStepCount()
            }
            
        }
    
    }

    @objc func play() {
        let tutorialViewController = TutorialViewViewController()
        self.present(tutorialViewController, animated: true, completion: nil)
    }
    
    @objc func openPreference() {
        let preferenceViewController = PreferenceViewController()
        self.navigationController?.pushViewController(preferenceViewController, animated: true)
    }

}
