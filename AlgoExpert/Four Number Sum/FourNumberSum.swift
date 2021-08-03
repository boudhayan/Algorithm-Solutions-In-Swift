//
//  FourNumberSum.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 04/08/21.
//

import Foundation

/**
 Time Complexity: O(n^3)
 Space Complexity: O(n^2)
 Note: 
 */
func fourNumberSum(array: [Int], targetSum: Int) -> [[Int]] {
    guard array.count > 3 else { return [] }
    var result = [[Int]]()
    let sortedNumbers = array.sorted()
    for idx in 0..<sortedNumbers.count - 3 {
        let key = sortedNumbers[idx]
        for j in idx+1..<sortedNumbers.count - 2 {
            let secondNumber = sortedNumbers[j]
            var leftIdx = j + 1
            var rightIdx = sortedNumbers.count - 1
            while leftIdx < rightIdx {
                let currentSum = key + secondNumber + sortedNumbers[leftIdx] + sortedNumbers[rightIdx]
                if currentSum < targetSum {
                    leftIdx += 1
                } else if currentSum > targetSum {
                    rightIdx -= 1
                } else {
                    result.append([key, secondNumber, sortedNumbers[leftIdx], sortedNumbers[rightIdx]])
                    leftIdx += 1
                    rightIdx -= 1
                }
            }
        }
        
        
    }
    return result
}
