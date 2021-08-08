//
//  ThreeSumClosest.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 08/08/21.
//

import Foundation
/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: https://leetcode.com/problems/3sum-closest/
 */
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    let numbers = nums.sorted()
    var closest = Int(UInt32.max)
    for idx in 0..<numbers.count - 2 {
        let first = numbers[idx]
        var left = idx + 1
        var right = numbers.count - 1
        while left < right {
            let currentSum = first + numbers[left] + numbers[right]
            if abs(currentSum - target) < abs(closest - target) {
                closest = currentSum
            }
            if currentSum > target {
                right -= 1
            } else if currentSum < target {
                left += 1
            } else {
                return currentSum
            }
        }
    }
    return closest
}
