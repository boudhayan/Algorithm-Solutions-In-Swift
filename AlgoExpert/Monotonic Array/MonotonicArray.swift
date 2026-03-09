//
//  MonotonicArray.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */
func isMonotonic(array: [Int]) -> Bool {
    guard array.count > 1 else { return true }
    var isIncreasing = true
    var isDecreasing = true
    var idx = 0
    while idx < array.count - 1 {
        if array[idx + 1] > array[idx] {
            isDecreasing = false
        }
        if array[idx + 1] < array[idx] {
            isIncreasing = false
        }
        idx += 1
    }
    return isDecreasing || isIncreasing
}
