//
//  Score.swift
//  Movel
//
//  Created by William Inx on 20/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import Foundation

class Score {
    var score:Int
    
    init() {
        score = 0
    }
    
    func isWinning(steps:Int, required:Int) -> Bool {
        if steps >= required {
            return true
        }
        else {
            return false
        }
    }
    
    func calculateScore(steps:Int, required:Int) -> Int {
        return 100 * (steps * 1/required)
    }
}
