//
//  MergeSort.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 23/07/21.
//

import Foundation

/**
 Time Complexity: O(nlogn)
 Space Complexity: O(n)
 Note: 
 */

func mergeSort(_ array:  [Int]) -> [Int] {
    if array.count == 1 { return array }
    let midIndex = (array.count - 1) / 2
    let leftHalf = Array(array[0...midIndex])
    let rightHalf = Array(array[midIndex + 1...array.count - 1])
    return mergeSortHelper(mergeSort(leftHalf), mergeSort(rightHalf))
}

func mergeSortHelper(_ leftHalf: [Int], _ rightHalf: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: leftHalf.count + rightHalf.count)
    var i = 0
    var j = 0
    var k = 0
    while i < leftHalf.count, j < rightHalf.count {
        if leftHalf[i] < rightHalf[j] {
            result[k] = leftHalf[i]
            i += 1
        } else {
            result[k] = rightHalf[j]
            j += 1
        }
        k += 1
    }
    
    while i < leftHalf.count {
        result[k] = leftHalf[i]
        i += 1
        k += 1
    }
    
    while j < rightHalf.count {
        result[k] = rightHalf[j]
        j += 1
        k += 1
    }
    return result
}
