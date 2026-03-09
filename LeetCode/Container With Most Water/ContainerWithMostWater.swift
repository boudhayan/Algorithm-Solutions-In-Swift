//
//  ContainerWithMostWater.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/04/22.
//

import Foundation

/**
 Question Link: https://leetcode.com/problems/container-with-most-water/
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */

func maxArea(_ height: [Int]) -> Int {
    var maxArea = Int(Int32.min)
    var left = 0
    var right = height.count - 1
    while left < right {
        let containerHeight = min(height[left], height[right])
        let containerWidth = right - left
        let containerArea = containerHeight * containerWidth
        maxArea = max(containerArea, maxArea)
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    return maxArea
}
