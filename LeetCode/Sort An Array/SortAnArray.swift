//
//  SortAnArray.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/10/22.
//

import Foundation

func sortArray(_ nums: [Int]) -> [Int] {
    var array = nums
    return mergeSort(&array)
}

func mergeSort(_ arr: inout [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    let mid = arr.count/2
    var left = Array(arr[0..<mid])
    var right = Array(arr[mid...])
    return  merge(left: mergeSort(&left), right: mergeSort(&right))
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var i = 0
    var j = 0
    var k = 0
    var result = [Int](repeating: 0, count: left.count + right.count)
    while i < left.count, j < right.count {
        if left[i] <= right[j] {
            result[k] = left[i]
            i += 1
        } else {
            result[k] = right[j]
            j += 1
        }
        k += 1
    }
    
    while i < left.count {
        result[k] = left[i]
        i += 1
        k += 1
    }
    
    while j < right.count {
        result[k] = right[j]
        j += 1
        k += 1
    }
    return result
}
