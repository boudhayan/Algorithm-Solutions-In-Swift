//
//  MinimumWaitingTime.swift
//  Algorithms In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(nlogn)
 Space Complexity: O(1)
 Note:
 */
func minimumWaitingTime(_ queries: inout [Int]) -> Int {
    queries.sort()
    var waitingTime = 0
    var totalWaitTime = 0
    for idx in 1..<queries.count {
       waitingTime += queries[idx - 1]
       totalWaitTime += waitingTime
    }
    return totalWaitTime
}
