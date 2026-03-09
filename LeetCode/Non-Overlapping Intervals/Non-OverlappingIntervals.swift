//
//  Non-OverlappingIntervals.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 27/09/21.
//

import Foundation

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    var intervalCount = 0
    let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
    var lastIntervalEnd = Int(Int32.min)
    for interval in sortedIntervals {
        if interval[0] >= lastIntervalEnd {
            lastIntervalEnd = interval[1]
        } else {
            intervalCount += 1
            lastIntervalEnd = min(lastIntervalEnd, interval[1])
        }
    }
    return intervalCount
}
