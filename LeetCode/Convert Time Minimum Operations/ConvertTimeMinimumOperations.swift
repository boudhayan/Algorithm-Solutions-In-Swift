//
//  ConvertTimeMinimumOperations.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 04/04/22.
//

import Foundation

/**
 Question Link: https://leetcode.com/problems/minimum-number-of-operations-to-convert-time/
 Time Complexity: O(1)
 Space Complexity: O(cn + co)
 Note: Cn is the length of current time and co is the length of the correct time
 */


func convertTime(_ current: String, _ correct: String) -> Int {
    let currentTimes = current.components(separatedBy: ":").map { Int($0)! }
    let correctTimes = correct.components(separatedBy: ":").map { Int($0)! }
    let curMin = (currentTimes[0] * 60) + currentTimes[1]
    let corMin = (correctTimes[0] * 60) + correctTimes[1]
    var diff = corMin - curMin
    var op = 0
    op += diff/60
    diff = diff%60
    op += diff/15
    diff = diff%15
    op += diff/5
    diff = diff%5
    op += diff/1
    diff = diff%1
    return op
}
