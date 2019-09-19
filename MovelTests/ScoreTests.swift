//
//  ScoreTests.swift
//  MovelTests
//
//  Created by William Inx on 19/09/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import XCTest
@testable import Movel

class ScoreTests: XCTestCase {

    let score = Score()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerfectScore() {
        let result = score.calculateScore(steps: 100, required: 100)
        XCTAssertEqual(result, 100)
    }
    
    func testFailedScore() {
        let result = score.calculateScore(steps: 0, required: 100)
        XCTAssertEqual(result, 0)
    }
    
    func testIsWinning() {
        let result = score.isWinning(steps: 100, required: 100)
        XCTAssertEqual(result, true)
    }
    
    func testIsLosing() {
        let result = score.isWinning(steps: 44, required: 100)
        XCTAssertEqual(result, false)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
