//
//  MergeIntervals.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/09/21.
//

import Foundation

func mergeIntervals(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else { return intervals }
    let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
    var idx = 0
    var result = [[Int]]()
    while idx < sortedIntervals.count - 1 {
        let first = sortedIntervals[idx]
        var start = first[0]
        var end = first[1]
        var cIdx = idx + 1
        while cIdx < sortedIntervals.count {
            let current = sortedIntervals[cIdx]
            let currentStart = current[0]
            let currentEnd = current[1]
            if currentStart <= end {
                start = min(start, currentStart)
                end = max(end, currentEnd)
            } else {
                break
            }
            cIdx += 1
        }
        result.append([start, end])
        idx = cIdx
    }
    if idx < sortedIntervals.count {
        result.append(sortedIntervals[sortedIntervals.count - 1])
    }
    return result
}
