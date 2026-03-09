//
//  KadanesAlgorithm.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/03/22.
//

import Foundation

// T: O(n), S: O(1)
func kadanesAlgorithm(array: [Int]) -> Int {
    var maxSum = Int(Int32.min)
    var currentSum = 0
    for num in array {
        maxSum = max(maxSum, currentSum + num)
        currentSum = max(0, currentSum + num)
    }
    return maxSum
}
