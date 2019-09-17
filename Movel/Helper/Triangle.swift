//
//  Triangle.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import UIKit

class Triangle: Trigonometry {
    
    func createPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: 60))
        path.addLine(to: CGPoint(x: 30, y: 30))
        path.addLine(to: .zero)
        
        return path
    }
}
