//
//  Challenge.swift
//  Movel
//
//  Created by William Inx on 17/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import Foundation

class Challenge {
    var preference:Preference
    
    init(duration: Float, intensity: String) {
        preference = Preference(intensity: intensity, duration: duration)
    }
    
    func createChallenge() -> Int {
        let multiplier = checkIntensityMultiplier()
        let duration = checkDuration()
        
        return Int((1 * duration) * multiplier)
    }
    
    fileprivate func checkIntensityMultiplier() -> Float {
        var multiplier:Float = 1.0
        
        switch preference.intensity {
        case "Easy":
            multiplier = 1.0 + Float.random(in: 0.1...0.9)
        case "Medium":
            multiplier = 2.0 + Float.random(in: 0.1...0.9)
        case "Hard":
            multiplier = 3.0 + Float.random(in: 0.1...0.9)
        default:
            multiplier = 1.0
        }
        
        return multiplier
    }
    
    fileprivate func checkDuration() -> Float {
        return preference.duration
    }
}
