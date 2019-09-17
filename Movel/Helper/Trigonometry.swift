//
//  Trigonometry.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

protocol Trigonometry {
    func createShape() -> CAShapeLayer
    func createPath() -> UIBezierPath
}

extension Trigonometry {
    
    func createShape() -> CAShapeLayer {
        let shape = CAShapeLayer()
        shape.path = createPath().cgPath
        shape.fillColor = UIColor.blue.cgColor
        return shape
    }
    
    func createPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        return path
    }
    
}
