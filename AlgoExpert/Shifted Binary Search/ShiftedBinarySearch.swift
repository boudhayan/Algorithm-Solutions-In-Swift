//
//  ShiftedBinarySearch.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 08/08/21.
//

import Foundation

/**
 Time Complexity: O(logn)
 Space Complexity: O(1)
 Note: 
 */
func shiftedBinarySearch(_ array: [Int], _ target: Int) -> Int {
    var left = 0
    var right = array.count - 1
    while left <= right {
        let mid = (left + right) / 2
        let potentialMatch = array[mid]
        let leftNumber = array[left]
        let rightNumber = array[right]
        if potentialMatch == target {
            return mid
        } else if leftNumber < potentialMatch {
            if target < potentialMatch, target >= leftNumber {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else {
            if target <= rightNumber, target > potentialMatch {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    return -1
}

