//
//  ThreeSumSmaller.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 02/04/22.
//

import Foundation

/**
 Question Link: https://leetcode.com/problems/3sum-smaller/
 Time Complexity: O(N^2)
 Space Complexity: O(1)
 Note: 
 */

func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 2 else { return 0 }
    let numbers = nums.sorted()
    var tripletsCount = 0
    for idx in stride(from: 0, to: numbers.count - 2, by: 1) {
        let cn = numbers[idx]
        var left = idx + 1
        var right = numbers.count - 1
        while right > left {
            let cs = cn + numbers[left] + numbers[right]
            if cs < target {
                tripletsCount += right - left
                left += 1
            } else {
                right -= 1
            }
        }
    }
    return tripletsCount
}
