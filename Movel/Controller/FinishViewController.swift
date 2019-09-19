//
//  FinishViewController.swift
//  Movel
//
//  Created by William Inx on 19/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    let finishView = FinishView()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = finishView
        
        finishView.scoreLabel.text = "Score : \(String(score))"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(gotoMainView))
        finishView.addGestureRecognizer(tap)
    }
    
    @objc func gotoMainView() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        saveScore()
    }
    
    func saveScore() {
        let userDefault = UserDefaults.standard
        userDefault.set(score, forKey: "score")
    }

}
