//
//  RemoveDuplicatesSortedArray.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/09/22.
//

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var i = 0
    while i < nums.count {
        if i + 1 >= nums.count {
            break
        }
        if nums[i+1] == nums[i] {
            nums.remove(at: i + 1)
        } else {
            i += 1
        }
    }
    return nums.count
}
