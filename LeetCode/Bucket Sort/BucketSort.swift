//
//  BucketSort.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/02/24.
//

import Foundation

func bucketSort(_ nums: inout [Int]) {
    var freq = [Int](repeating: 0, count: nums.max()! + 1)
    for num in nums {
        freq[num] += 1
    }
    var pos = 0
    for i in 0..<freq.count {
        for j in 0..<freq[i] {
            nums[pos] = i
            pos += 1
        }
    }
}
