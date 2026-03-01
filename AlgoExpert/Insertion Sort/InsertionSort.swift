//
//  InsertionSort.swift
//  Algorithms In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(n^2)
 Space Complexity: O(1)
 Note: 
 */
func insertionSort(array: inout [Int]) -> [Int] {
    for idx in 1..<array.count {
        var sortedIdx = idx - 1
        let key = array[idx]
        while sortedIdx >= 0, key < array[sortedIdx] {
            array[sortedIdx + 1] = array[sortedIdx]
            sortedIdx -= 1
        }
        array[sortedIdx + 1] = key
    }
    return array
}
