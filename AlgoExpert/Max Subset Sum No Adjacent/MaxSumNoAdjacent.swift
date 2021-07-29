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

