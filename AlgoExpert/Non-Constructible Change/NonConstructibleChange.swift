//
//  NonConstructibleChange.swift
//  Algorithms In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(NlogN)
 Space Complexity: O(1)
 Note: for sorting, O(nlogn) is the time complexity
 */
func nonConstructibleChange(_ coins: inout [Int]) -> Int {
    coins.sort()
    var minimumChange = 0
    for coin in coins {
        if coin > minimumChange + 1 {
            return minimumChange + 1
        }
        minimumChange += coin
    }
    return minimumChange + 1
}
