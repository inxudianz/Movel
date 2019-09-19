//
//  TutorialViewViewController.swift
//  Movel
//
//  Created by William Inx on 19/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    let tutorialView = TutorialView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = tutorialView
        
        tutorialView.continueButton.addTarget(self, action: #selector(startGame), for: .touchDown)
        
    }
    
    @objc func startGame() {
        let playViewController = PlayViewController()
        self.present(playViewController,animated: true)
    }

}
