//
//  QuickSort.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/07/21.
//

import Foundation

/**
 Time Complexity: O(nlogn)
 Space Complexity: O(logn)
 Note: 
 */
func quickSort(_ array: inout [Int]) -> [Int] {
    quickSortHelper(&array, start: 0, end: array.count - 1)
    return array
}


func quickSortHelper(_ array: inout [Int], start: Int, end: Int) {
    if start >= end {
        return
    }
    let pivotElement = array[start]
    var leftIdx = start + 1
    var rightIdx = end
    
    while leftIdx <= rightIdx {
        if array[leftIdx] > pivotElement, array[rightIdx] < pivotElement {
            let temp = array[leftIdx]
            array[leftIdx] = array[rightIdx]
            array[rightIdx] = temp
            leftIdx += 1
            rightIdx -= 1
        }
        if array[leftIdx] <= pivotElement {
            leftIdx += 1
        }
        if array[rightIdx] >= pivotElement {
            rightIdx -= 1
        }
    }
    let temp = array[rightIdx]
    array[rightIdx] = pivotElement
    array[start] = temp
    
    quickSortHelper(&array, start: start, end: rightIdx - 1)
    quickSortHelper(&array, start: rightIdx + 1, end: end)
}
