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
        
        tutorialView.continueButton.addTarget(self, action: #selector(startGame(sender:)), for: .touchDown)
        
    }
    
    @objc func startGame(sender: UIButton!) {
        sender.layer.opacity = 0.7
        UIView.animate(withDuration: 0.2) {
            sender.layer.opacity = 1
        }
        
        let playViewController = PlayViewController()
        self.present(playViewController,animated: true)
    }

}
