//
//  BubbleSort.swift
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
func bubbleSort(array: inout [Int]) -> [Int] {
    for idx in 0..<array.count {
        for jdx in 0..<array.count - idx - 1 {
            if array[jdx] > array[jdx + 1] {
                let temp = array[jdx]
                array[jdx] = array[jdx + 1]
                array[jdx + 1] = temp
            }
        }
    }
    return array
}
