//
//  Triangle.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class Triangle: Trigonometry {
    
    var shape:CAShapeLayer!
    
    init(base:UIView) {
        shape = createShape()
        shape.frame = CGRect(x: base.frame.maxX / 4 - 20, y: base.frame.maxY / 8 - 20, width: 150, height: 250)
    }
    internal func createPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: 90))
        path.addLine(to: CGPoint(x: 90, y: 45))
        path.addLine(to: .zero)
        
        return path
    }
}
