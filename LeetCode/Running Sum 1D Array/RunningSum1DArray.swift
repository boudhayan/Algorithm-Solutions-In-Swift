//
//  RunningSum1DArray.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/10/22.
//

import Foundation

func runningSum(_ nums: [Int]) -> [Int] {
    var rs = 0
    var sums = nums
    for idx in 0..<sums.count {
        sums[idx] += rs
        rs = sums[idx]
    }
    return sums
}
