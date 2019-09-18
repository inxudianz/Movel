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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self , action: #selector(openPreference))
        
        view = HomeView()
        
        DispatchQueue.global().async {
            self.health.readSteps()
            DispatchQueue.main.async {
                self.health.getStepCount()
            }
            
        }
        
        
       
        
        
        
        
    }
    override func viewDidDisappear(_ animated: Bool) {
    }
    @objc func openPreference() {
        let preferenceViewController = PreferenceViewController()
        self.navigationController?.pushViewController(preferenceViewController, animated: true)
    }

}
