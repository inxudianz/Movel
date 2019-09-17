//
//  MainView.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class HomeView: UIView {

    var playButton:UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        playButton = UIButton(type: .contactAdd)
        playButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        playButton.titleLabel?.text = "TES"
        self.addSubview(playButton)
    }
}
