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

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note:
 */

func subarraySort1(array: [Int]) -> [Int] {
    var minOutOfOrder = Int(Int32.max)
    var maxOutOfOrder = Int(Int32.min)
    var start = -1
    var end = -1
    for idx in 0..<array.count where isOutOfOrder(index: idx, array: array) {
        minOutOfOrder = min(minOutOfOrder, array[idx])
        maxOutOfOrder = max(maxOutOfOrder, array[idx])
    }
    for idx in 0..<array.count where array[idx] > minOutOfOrder {
        start = idx
        break
    }
    for idx in stride(from: array.count - 1, through: 0, by: -1) where array[idx] < maxOutOfOrder {
        end = idx
        break
    }
    return [start, end]
}

func isOutOfOrder(index: Int, array: [Int]) -> Bool {
    if index == 0 {
        return array[index] > array[index + 1]
    }
    
    if index == array.count - 1 {
        return array[index] < array[index - 1]
    }
    
    return array[index] < array[index - 1] || array[index] > array[index + 1]
}
