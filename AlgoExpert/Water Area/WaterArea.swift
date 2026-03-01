//
//  WaterArea.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 13/09/22.
//

import Foundation


/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note:
 */
func waterArea1(heights: [Int]) -> Int {
    var leftMaxHeights = Array(repeating: 0, count: heights.count)
    var rightMaxHeights = Array(repeating: 0, count: heights.count)
    var leftMax = 0
    var rightMax = 0
    for i in stride(from: 1, through: heights.count - 1, by: 1) {
        leftMax = max(leftMax, heights[i - 1])
        leftMaxHeights[i] = leftMax
    }
    for j in stride(from: heights.count - 2, through: 0, by: -1) {
        rightMax = max(rightMax, heights[j + 1])
        rightMaxHeights[j] = rightMax
    }
    var trappedWater = 0
    for i in stride(from: 0, through: heights.count - 1, by: 1) {
        let currentPositionTrappedWater = min(leftMaxHeights[i], rightMaxHeights[i]) - heights[i]
        trappedWater += max(currentPositionTrappedWater, 0)
    }
    return trappedWater
}

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */
func waterArea(heights: [Int]) -> Int {
    var l = 0
    var r = heights.count - 1
    var leftMax = 0
    var rightMax = 0
    var trappedWater = 0
    while l < r {
        if heights[l] < heights[r] {
            if heights[l] > leftMax {
                leftMax = heights[l]
            } else {
                trappedWater += max(leftMax - heights[l], 0)
            }
            l += 1
        } else {
            if heights[r] > rightMax {
                rightMax = heights[r]
            } else {
                trappedWater += max(rightMax - heights[r], 0)
            }
            r -= 1
        }
    }
    return trappedWater
}

//print(waterArea(heights: [0, 8, 0, 0, 5, 0, 0, 10, 0, 0, 1, 1, 0, 3]))
