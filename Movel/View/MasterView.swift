//
//  MasterView.swift
//  Movel
//
//  Created by William Inx on 19/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

protocol MasterViewDelegate: UIView {
    func setupView()
}

class MasterView: UIView, MasterViewDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .white
    }
}

extension MasterViewDelegate {
    
    func setupView() {
        backgroundColor = .white
    }
    
    func addToView() {
        // Add all objects to view
    }
}


