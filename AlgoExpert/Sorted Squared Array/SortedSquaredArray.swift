//
//  SortedSquaredArray.swift
//  Algorithms In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(N)
 Space Complexity: O(N)
 Note:
 */
func sortedSquaredArray(_ array: [Int]) -> [Int] {
    var squaredArray = Array(repeating: 0, count: array.count)
    var nextToInsertedIdx = squaredArray.count - 1
    var leftIdx = 0
    var rightIdx = array.count - 1
    while leftIdx <= rightIdx {
        if abs(array[leftIdx]) > abs(array[rightIdx]) {
            squaredArray[nextToInsertedIdx] = array[leftIdx] * array[leftIdx]
            leftIdx += 1
        } else {
            squaredArray[nextToInsertedIdx] = array[rightIdx] * array[rightIdx]
            rightIdx -= 1
        }
        nextToInsertedIdx -= 1
    }
    return squaredArray
}
