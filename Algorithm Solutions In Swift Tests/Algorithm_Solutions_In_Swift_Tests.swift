//
//  Algorithm_Solutions_In_Swift_Tests.swift
//  Algorithm Solutions In Swift Tests
//
//  Created by Boudhayan Biswas on 18/07/21.
//

import XCTest
@testable import Algorithm_Solutions_In_Swift

class Algorithm_Solutions_In_Swift_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var arr = [3, 2, 1]
        XCTAssertEqual(bubbleSort(array: &arr), [1, 2, 3])
    }

    

}
