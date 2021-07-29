//
//  MaxSumNoAdjacent.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note:
 */
func maximumSubsetSum(array: [Int]) -> Int {
    guard !array.isEmpty else { return 0 }
    if array.count == 1 {
        return array[0]
    }
    var maxSums = Array(repeating: 0, count: array.count)
    maxSums[0] = array[0]
    maxSums[1] = max(array[0], array[1])
    for idx in 2..<array.count {
        maxSums[idx] = max(maxSums[idx - 1], maxSums[idx - 2] + array[idx])
    }
    return maxSums[maxSums.count - 1]
}

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */
func maximumSubsetSum2(array: [Int]) -> Int {
    if array.count == 0 { return 0 }
    if array.count == 1 { return array[0] }
    var second = array[0]
    var first = max(array[0], array[1])
    for idx in 2..<array.count {
        let temp = first
        first = max(first, second + array[idx])
        second = temp
    }
    return first
}
