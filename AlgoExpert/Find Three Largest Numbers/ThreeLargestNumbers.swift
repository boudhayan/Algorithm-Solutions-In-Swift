//
//  ThreeLargestNumbers.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */
func findThreeLargestNumbers(array: [Int]) -> [Int] {
    var threeLargestNumbers = Array(repeating: Int.min, count: 3)
    for number in array {
        rearrange(number: number, largests: &threeLargestNumbers)
    }
    return threeLargestNumbers
}

func rearrange(number: Int, largests: inout [Int]) {
    var toBeInsertedIdx = -1
    if number > largests[2] {
        toBeInsertedIdx = 2
    } else if number > largests[1] {
        toBeInsertedIdx = 1
    } else if number > largests[0] {
        toBeInsertedIdx = 0
    } else {
        return
    }
    var currentIdx = toBeInsertedIdx
    while currentIdx > 0 {
        let temp = largests[currentIdx - 1]
        largests[currentIdx - 1] = largests[toBeInsertedIdx]
        currentIdx -= 1
        largests[toBeInsertedIdx] = temp
    }
    largests[toBeInsertedIdx] = number
}
