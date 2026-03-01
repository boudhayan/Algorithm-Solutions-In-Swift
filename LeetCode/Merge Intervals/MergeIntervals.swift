//
//  MergeIntervals.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 11/08/21.
//

import Foundation
/**
 Time Complexity: O(nlogn)
 Space Complexity: O(1)
 Note: 
 */
func merge(_ intervals: [[Int]]) -> [[Int]] {
    let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
    var result = [[Int]]()
    var previousInterval = sortedIntervals[0]
    for idx in 1..<sortedIntervals.count {
        let currentStartingPoint = sortedIntervals[idx][0]
        if currentStartingPoint < previousInterval[1] || currentStartingPoint == previousInterval[0] || currentStartingPoint == previousInterval[1] {
            previousInterval[0] = min(previousInterval[0], sortedIntervals[idx][0])
            previousInterval[1] = max(previousInterval[1], sortedIntervals[idx][1])
        } else {
            result.append(previousInterval)
            previousInterval = sortedIntervals[idx]
        }
    }
    result.append(previousInterval)
    return result
}
