//
//  MergeOverlappingIntervals.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 30/07/21.
//

import Foundation

/**
 Time Complexity: O(nlogn)
 Space Complexity: O(n)
 Note: 
 */
func mergeOverlappingIntervals(_ intervals: [[Int]]) -> [[Int]] {
    let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
    var mergedIntervals = [[Int]]()
    var idx = 1
    var previousInterval = sortedIntervals[0]
    while idx < sortedIntervals.count {
        let currentInterval = sortedIntervals[idx]
        if currentInterval[0] <= previousInterval[1] {
            if currentInterval[1] < previousInterval[1] {
                idx += 1
                continue
            }
            previousInterval[1] = currentInterval[1]
        } else {
            mergedIntervals.append(previousInterval)
            previousInterval = currentInterval
        }
        idx += 1
    }
    mergedIntervals.append(previousInterval)
    return mergedIntervals
}
