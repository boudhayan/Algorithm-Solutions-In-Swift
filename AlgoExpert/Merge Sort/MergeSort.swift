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
func mergeSort(_ array: inout [Int]) -> [Int] {
    if array.count <= 1 { return array }
    let middleIndex = array.count / 2
    var leftHalf = Array(array[0..<middleIndex])
    var rightHalf = Array(array[middleIndex..<array.count])
    return merge(mergeSort(&leftHalf), mergeSort(&rightHalf))
}


func merge(_ leftHalf: [Int], _ rightHalf: [Int]) -> [Int] {
    var mergedArray = Array(repeating: 0, count: leftHalf.count + rightHalf.count)
    var leftIdx = 0
    var rightIdx = 0
    var mergeIdx = 0
    while leftIdx < leftHalf.count, rightIdx < rightHalf.count {
        if leftHalf[leftIdx] < rightHalf[rightIdx] {
            mergedArray[mergeIdx] = leftHalf[leftIdx]
            leftIdx += 1
            mergeIdx += 1
        } else  {
            mergedArray[mergeIdx] = rightHalf[rightIdx]
            rightIdx += 1
            mergeIdx += 1
        }
    }
    
    while leftIdx < leftHalf.count {
        mergedArray[mergeIdx] = leftHalf[leftIdx]
        leftIdx += 1
        mergeIdx += 1
    }
    
    while rightIdx < rightHalf.count {
        mergedArray[mergeIdx] = rightHalf[rightIdx]
        rightIdx += 1
        mergeIdx += 1
    }
    return mergedArray
}
