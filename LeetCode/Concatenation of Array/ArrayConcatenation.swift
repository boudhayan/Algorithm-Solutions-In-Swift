//
//  ArrayConcatenation.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/09/22.
//

import Foundation

func getConcatenation(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: 2 * nums.count)
    for i in 0..<2*nums.count {
        let idx = i%nums.count
        result[i] = nums[idx]
    }
    return result
}
