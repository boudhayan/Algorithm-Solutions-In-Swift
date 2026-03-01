//
//  MajorityElement.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/09/21.
//

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    var m = nums[0]
    var c = 1
    for idx in 1..<nums.count {
        if c == 0 {
            m = nums[idx]
            c = 1
        } else if nums[idx] == m {
            c += 1
        } else {
            c -= 1
        }
    }
    return m
}
