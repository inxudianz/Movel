//
//  FinishView.swift
//  Movel
//
//  Created by William Inx on 19/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class FinishView: MasterView {

    let timesUPLabel = UILabel()
    let scoreLabel = UILabel()
    let instruction = UILabel()
    
    override func setupView() {
        backgroundColor = mainColor
        
        timesUPLabel.frame = CGRect(x: 112, y: 400, width: 200, height: 48)
        timesUPLabel.textColor = textColor
        timesUPLabel.text = "Time's Up!"
        timesUPLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        
        scoreLabel.frame = CGRect(x: 135, y: 477, width: 250, height: 34)
        scoreLabel.textColor = textColor
        scoreLabel.text = "Score : 0"
        scoreLabel.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        
        instruction.frame = CGRect(x: 119, y: 616, width: 176, height: 20)
        instruction.textColor = textColor
        instruction.text = "Tap anywhere to continue"
        instruction.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        addSubview(timesUPLabel)
        addSubview(scoreLabel)
        addSubview(instruction)
    }
}
