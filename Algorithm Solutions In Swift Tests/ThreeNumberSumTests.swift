//
//  ThreeNumberSumTests.swift
//  Algorithm Solutions In Swift Tests
//
//  Created by Boudhayan Biswas on 18/07/21.
//

import XCTest

class ThreeNumberSumTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThreeNumberSumOne() {
        var array = [12, 3, 1, 2, -6, 5, -8, 6]
        let triplets = threeNumberSum(array: &array, targetSum: 0)
        XCTAssert(triplets.count > 0)
    }
}
