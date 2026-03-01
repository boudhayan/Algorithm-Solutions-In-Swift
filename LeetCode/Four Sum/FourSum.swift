//
//  FourSum.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 05/08/23.
//

import Foundation

//https://leetcode.com/problems/4sum/
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count > 3 else { return [] }
    var result = [[Int]]()
    let sortedNumbers = nums.sorted()
    for i in 0..<sortedNumbers.count - 3 {
        if i > 0, sortedNumbers[i] == sortedNumbers[i - 1] {
            continue
        }
        for j in (i+1)..<sortedNumbers.count - 2 {
            if j > i+1, sortedNumbers[j] == sortedNumbers[j - 1] {
                continue
            }
            let firstSum = sortedNumbers[i] + sortedNumbers[j]
            var left = j + 1
            var right = sortedNumbers.count - 1
            while left < right {
                let totalSum = firstSum + sortedNumbers[left] + sortedNumbers[right]
                if totalSum < target {
                    left += 1
                } else if totalSum > target {
                    right -= 1
                } else {
                    result.append([sortedNumbers[i], sortedNumbers[j], sortedNumbers[left], sortedNumbers[right]])
                    left += 1
                    right -= 1
                    while left < sortedNumbers.count, sortedNumbers[left] == sortedNumbers[left - 1] {
                        left += 1
                    }
                }
            }
        }
    }
    return result
}
