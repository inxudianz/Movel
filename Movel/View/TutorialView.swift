//
//  TutorialView.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class TutorialView: MasterView {

    let trophyImage = UIImageView()
    let descLabel = UILabel()
    let continueButton = UIButton()
    
    override func setupView() {
        backgroundColor = .white
        
        let trophy = UIImage(named: "trophy")
        trophyImage.image = trophy
        trophyImage.frame = CGRect(x: 57, y: 244, width: 300, height: 300)
        
        descLabel.frame = CGRect(x: 108, y: 544, width: 199, height: 90)
        descLabel.numberOfLines = 0
        descLabel.textAlignment = .center
        descLabel.text = "Reach the required amount \n of steps to win"
        descLabel.font = descLabel.font.withSize(16)
        descLabel.textColor = textColor
        
        continueButton.frame = CGRect(x: 107, y: 752, width: 200, height: 50)
        continueButton.layer.cornerRadius = 8
        continueButton.layer.backgroundColor = buttonColor?.cgColor
        continueButton.setTitle("Continue", for: .normal)
        
        
        self.addSubview(trophyImage)
        self.addSubview(descLabel)
        self.addSubview(continueButton)
    }

}
