//
//  ThreeNumberSum.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/07/21.
//

import Foundation

/**
 Time Complexity: O(N^2)
 Space Complexity: O(N)
 Note: 
 */
func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
    array.sort()
    var triplets = [[Int]]()
    for idx in 0..<array.count {
        let first = array[idx]
        var startIdx = idx + 1
        var endIdx = array.count - 1
        while startIdx < endIdx {
            let currentSum = first + array[startIdx] + array[endIdx]
            if currentSum < targetSum {
                startIdx += 1
            } else if currentSum > targetSum {
                endIdx -= 1
            } else {
                triplets.append([first, array[startIdx], array[endIdx]])
                startIdx += 1
                endIdx -= 1
            }
        }
    }
    return triplets
}
