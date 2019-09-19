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
    
    override func setupView() {
        backgroundColor = mainColor
        
        countdownLabel.frame = CGRect(x: 126, y: 424, width: 180, height: 48)
        countdownLabel.textAlignment = .center
        countdownLabel.textColor = textColor
        countdownLabel.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        countdownLabel.text = "Ready?"
        
        timer.frame = CGRect(x: 182, y: 504, width: 70, height: 48)
        timer.text = "00"
        timer.textColor = textColor
        timer.isHidden = true
        timer.font = UIFont.systemFont(ofSize: 28, weight: .light)
        timer.textAlignment = .justified
        
        addSubview(countdownLabel)
        addSubview(timer)
    }
}
