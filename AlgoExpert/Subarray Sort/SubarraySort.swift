//
//  SubarraySort.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 31/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note:
 */
func subarraySort(array: [Int]) -> [Int] {
    var minimumElement = Int(Int32.max)
    var minIndex = -1
    for idx in 0..<array.count - 1 {
        if array[idx + 1] < array[idx], array[idx + 1] < minimumElement {
            minimumElement = array[idx + 1]
            minIndex = idx + 1
        }
    }
    var maximumElement = Int(Int32.min)
    var maxIndex = -1
    if minIndex != -1 {
        for idx in 0..<minIndex {
            if array[idx] > maximumElement {
                maximumElement = array[idx]
                maxIndex = idx
            }
        }
    } else {
        return [-1, -1]
    }
    var start = 0
    var end = array.count - 1
    while start < minIndex {
        if array[minIndex] >= array[start] {
            start += 1
        } else {
            break
        }
    }
    
    while maxIndex < end {
        if array[maxIndex] <= array[end] {
            end -= 1
        } else {
            break
        }
    }
    
    
    return [start, end]
}
