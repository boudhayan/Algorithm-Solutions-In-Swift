//
//  SortedRotated.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 26/02/26.
//

// problem link: https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/

func check(_ nums: [Int]) -> Bool {
    var count = 0
    for i in stride(from: 1, to: nums.count, by: 1) {
        if nums[i] > nums[(i + 1)%nums.count] {
            count += 1
        }
    }
    return count <= 1
}
