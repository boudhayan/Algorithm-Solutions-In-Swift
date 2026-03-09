//
//  QuickSort.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/07/21.
//

import Foundation

func quickSort(_ array: inout [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    quickSortHelper(&array, start: 0, end: array.count - 1)
    return array
}

func quickSortHelper(_ array: inout [Int], start: Int, end: Int) {
    if start > end { return }
    var left = start + 1
    var right = end
    let pdx = start
    while right >= left {
        let pivot = array[pdx]
        if array[left] > pivot, array[right] < pivot {
            let temp = array[left]
            array[left] = array[right]
            array[right] = temp
        }
        if array[left] <= pivot {
            left += 1
        }
        if array[right] >= pivot {
            right -= 1
        }
    }
    let temp = array[right]
    array[right] = array[pdx]
    array[pdx] = temp
    
    let isLeftSmaller = (right - 1) - start <  end - (right + 1)
    if isLeftSmaller {
        quickSortHelper(&array, start: start, end: right - 1)
        quickSortHelper(&array, start: right + 1, end: end)
    } else {
        quickSortHelper(&array, start: right + 1, end: end)
        quickSortHelper(&array, start: start, end: right - 1)

    }
}

