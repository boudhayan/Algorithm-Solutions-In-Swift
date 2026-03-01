//
//  SmallestDifference.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/07/21.
//

import Foundation

/**
 Time Complexity: O(nlog(n) + mlog(m))
 Space Complexity: O(1)
 Note:
 */
func smallestDifference(arrayOne: inout [Int], arrayTwo: inout [Int]) -> [Int] {
    arrayOne.sort()
    arrayTwo.sort()
    var firstIdx = 0
    var secondIdx = 0
    var pairs = [Int]()
    var minimumDifference = Int.max
    while firstIdx < arrayOne.count, secondIdx < arrayTwo.count {
        let currentAbsoluteDifference = abs(arrayOne[firstIdx] - arrayTwo[secondIdx])
        if currentAbsoluteDifference < minimumDifference {
            minimumDifference = currentAbsoluteDifference
            pairs.removeAll()
            pairs = [arrayOne[firstIdx], arrayTwo[secondIdx]]
        }
        if arrayOne[firstIdx] > arrayTwo[secondIdx] {
            secondIdx += 1
        } else {
            firstIdx += 1
        }
    }
    return pairs
}
