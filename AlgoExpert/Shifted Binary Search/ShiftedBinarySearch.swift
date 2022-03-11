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

// [5, 4, 3, 0, 1, 2]
func shiftedBinarySearch(_ array: [Int], _ target: Int) -> Int {
    guard !array.isEmpty else { return -1 }
    var start = 0
    var end = array.count - 1
    while start <= end {
        // mid index will always divide the array in two sorted sub array or one sorted and one unsorted subarray
        // we will check if the left half is sorted first
        // since the array is rotated, only the sorted part can give some useful information to us like whether the sorted part contains the target or not. If it does not contain then only we will look into the unsorted part using the same algo
        let mid = start + (end - start) / 2
        if array[mid] == target {
            // found the targer and return the index
            return mid
        } else if array[mid] >= array[start] {
            // if mid element is greater than or equal to the start element then it means that left half of the array is sorted
            if target >= array[start], target < array[mid] {
                // if target lies between the start of the left half and end of the left half, then we can ignore the right half
                end = mid - 1
            } else {
                // target does not lies in left half, so we have to discard the left half and need to look into the right half
                start = mid + 1
            }
        } else {
            // right half of the array is sorted
            if target > array[mid], target <= array[end] {
                // target lies in between the start of the right half and end of the right half, so we can discard the left half
                start = mid + 1
            } else {
                // target does not lies in right half, so we have to discard the right half and need to look into the left half
                end = mid - 1
            }
        }
    }
    return -1
}
