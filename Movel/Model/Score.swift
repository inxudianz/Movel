//
//  Score.swift
//  Movel
//
//  Created by William Inx on 20/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import Foundation

class Score {
    
    func isWinning(steps:Int, required:Int) -> Bool {
        if steps >= required {
            return true
        }
        else {
            return false
        }
    }
    
    func calculateScore(steps:Int, required:Int) -> Int {
        let result = Int(100 * Float((Float(steps) / Float(required))))
        return result
    }
}
