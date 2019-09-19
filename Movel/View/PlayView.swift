//
//  PlayView.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class PlayView: MasterView {
    
    let countdownLabel = UILabel()
    let timer = UILabel()
    let runLabel = UILabel()
    let instruction = UILabel()
    
    override func setupView() {
        backgroundColor = mainColor
        
        countdownLabel.frame = CGRect(x: 125, y: 424, width: 190, height: 48)
        countdownLabel.textColor = textColor
        countdownLabel.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        countdownLabel.text = "Ready?"
        countdownLabel.textAlignment = .center
        
        timer.frame = CGRect(x: 182, y: 504, width: 70, height: 48)
        timer.text = "00"
        timer.textColor = textColor
        timer.isHidden = true
        timer.font = UIFont.systemFont(ofSize: 28, weight: .light)
        timer.textAlignment = .justified
        
        runLabel.frame = CGRect(x: 159, y: 344, width: 96, height: 48)
        runLabel.textAlignment = .center
        runLabel.textColor = textColor
        runLabel.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        runLabel.text = "RUN"
        runLabel.isHidden = true
        
        instruction.frame = CGRect(x: 119, y: 616, width: 176, height: 20)
        instruction.textColor = textColor
        instruction.text = "Tap anywhere to continue"
        instruction.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        instruction.isHidden = true
        
        addSubview(countdownLabel)
        addSubview(timer)
        addSubview(runLabel)
        addSubview(instruction)
    }
}
