//
//  MainView.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class HomeView: MasterView {

    let playButton = UIButton()
    let topScoreLabel = UILabel()
    let topScore = UILabel()
    let playLabel = UILabel()
    
    override func setupView() {
        backgroundColor = .white
        
        playButton.frame = CGRect(x: 120, y: 361, width: 174, height: 174)
        playButton.layer.cornerRadius = playButton.frame.width / 2
        playButton.layer.backgroundColor = textColor?.cgColor
        let playTriangle = Triangle(base: playButton)
        
        playButton.layer.addSublayer(playTriangle.shape)
        
        topScoreLabel.frame = CGRect(x: 148, y: 141, width: 128, height: 34)
        topScoreLabel.text = "Last Score"
        topScoreLabel.textAlignment = .center
        topScoreLabel.textColor = textColor
        topScoreLabel.font = topScoreLabel.font.withSize(28.0)
        
        topScore.frame = CGRect(x: 183, y: 197, width: 48, height: 34)
        topScore.text = "0"
        topScore.textAlignment = .center
        topScore.textColor = textColor
        topScore.font = topScore.font.withSize(28)
        
        playLabel.frame = CGRect(x: 167, y: 557, width: 80, height: 38)
        playLabel.text = "PLAY"
        playLabel.textAlignment = .center
        playLabel.textColor = textColor
        playLabel.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        
        
        self.addSubview(playButton)
        self.addSubview(topScoreLabel)
        self.addSubview(topScore)
        self.addSubview(playLabel)
    }
}
