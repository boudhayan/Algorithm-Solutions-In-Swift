//
//  SortedArraySquares.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/09/21.
//

import Foundation

func sortedSquares(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else { return [] }
    var result = Array(repeating: 0, count: nums.count)
    var low = 0
    var high = nums.count - 1
    var position = nums.count - 1
    while low <= high, position >= 0 {
        if abs(nums[low]) > abs(nums[high]) {
            // insert low
            result[position] = nums[low] * nums[low]
            low += 1
        } else {
            // insert high
            result[position] = nums[high] * nums[high]
            high -= 1
        }
        position -= 1
    }
    return result
}
