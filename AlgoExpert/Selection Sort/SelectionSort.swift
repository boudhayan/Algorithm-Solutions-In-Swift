//
//  SelectionSort.swift
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
func selectionSort(array: inout [Int]) -> [Int] {
    for idx in 0..<array.count {
        var minIdx = idx
        for jdx in (idx+1)..<array.count {
            if array[jdx] < array[minIdx] {
                minIdx = jdx
            }
        }
        let temp = array[idx]
        array[idx] = array[minIdx]
        array[minIdx] = temp
    }
    return array
}
