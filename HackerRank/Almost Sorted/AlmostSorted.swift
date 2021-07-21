//
//  AlmostSorted.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/07/21.
//

import Foundation

func isSorted(_ array: [Int]) -> Bool {
    for idx in stride(from: array.count - 1, through: 1, by: -1) {
        if array[idx] < array[idx - 1] {
            return false
        }
    }
    return true
}


func swap(_ array: inout [Int], _ i: Int, _ j: Int) {
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}


func reverse(_ array: inout [Int], from start: Int, to end: Int) {
    var left = start
    var right = end
    while left <= right {
        swap(&array, left, right)
        left += 1
        right -= 1
    }
}

func almostSorted(arr: [Int]) {
    var array = arr
    if isSorted(array) {
        print("yes")
        return
    }
    var leftDipIdx = 0
    for idx in 0..<arr.count - 1 {
        if array[idx] > array[idx + 1] {
            leftDipIdx = idx
            break
        }
    }
    
    var rightDipIdx = 0
    for idx in stride(from: array.count - 1, through: 1, by: -1) {
        if array[idx] < array[idx - 1] {
            rightDipIdx = idx
            break
        }
    }
    swap(&array, leftDipIdx, rightDipIdx)
    if isSorted(array) {
        print("yes")
        return
    }
    swap(&array, leftDipIdx, rightDipIdx)
    reverse(&array, from: leftDipIdx, to: rightDipIdx)
    if isSorted(array) {
        print("yes")
        return
    }
    print("no")
}
