//
//  MergeSort.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 15/08/21.
//

import Foundation

func mergeSort(of array: [Int]) -> [Int] {
    if array.count == 1 {
        return array
    }
    let mid = array.count / 2
    let leftHalf = Array(array[0..<mid])
    let rightHalf = Array(array[mid..<array.count])
    return mergeSorted(leftArray: mergeSort(of: leftHalf), rightArray: mergeSort(of: rightHalf))
}

func mergeSorted(leftArray: [Int], rightArray: [Int]) -> [Int] {
    var mergedArray = Array(repeating: 0, count: leftArray.count + rightArray.count)
    var ldx = 0
    var rdx = 0
    var mdx = 0
    while ldx < leftArray.count, rdx < rightArray.count {
        if leftArray[ldx] < rightArray[rdx] {
            mergedArray[mdx] = leftArray[ldx]
            mdx += 1
            ldx += 1
        } else if leftArray[ldx] > rightArray[rdx] {
            mergedArray[mdx] = rightArray[rdx]
            mdx += 1
            rdx += 1
        } else {
            mergedArray[mdx] = leftArray[ldx]
            mdx += 1
            ldx += 1
            mergedArray[mdx] = rightArray[rdx]
            mdx += 1
            rdx += 1
        }
    }
    
    while ldx < leftArray.count {
        mergedArray[mdx] = leftArray[ldx]
        mdx += 1
        ldx += 1
    }
    
    while rdx < rightArray.count {
        mergedArray[mdx] = rightArray[rdx]
        rdx += 1
        mdx += 1
    }
    return mergedArray
}
