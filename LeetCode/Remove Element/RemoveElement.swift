//
//  RemoveElement.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/09/22.
//

import Foundation

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var l = 0
    var r = nums.count - 1
    var k = 0
    while l <= r, l < nums.count, r >= 0 {
        if nums[r] == val {
            r -= 1
            k += 1
            continue
        }
        if nums[l] == val {
            nums.swapAt(l, r)
            l += 1
            r -= 1
            k += 1
        } else {
            l += 1
        }
    }
    return nums.count - k
}

