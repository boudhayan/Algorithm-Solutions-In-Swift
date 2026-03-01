//
//  BinarySearch.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(logn)
 Space Complexity: O(logn)
 Note: 
 */
func binarySearch(array: [Int], target: Int) -> Int {
    return binarySearchHelper(array: array, target: target, start: 0, end: array.count - 1)
}

func binarySearchHelper(array: [Int], target: Int, start: Int, end: Int) -> Int {
    if start > end { return -1 }
    let mid = start + (end - start) / 2
    if target < array[mid] {
        return binarySearchHelper(array: array, target: target, start: start, end: mid - 1)
    } else if target > array[mid] {
        return binarySearchHelper(array: array, target: target, start: mid + 1, end: end)
    } else {
        return mid
    }
}
