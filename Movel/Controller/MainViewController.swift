//
//  MainViewController.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class MainViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController()
        
        viewControllers = [homeViewController]
        
        
    }

}
