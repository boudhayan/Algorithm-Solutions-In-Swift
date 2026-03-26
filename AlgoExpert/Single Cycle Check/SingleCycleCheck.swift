//
//  SingleCycleCheck.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 23/07/21.
//

import Foundation

/**
 Time Complexity: O(N)
 Space Complexity: O(1)
 Note:
 */
func hasSingleCycle(array: [Int]) -> Bool {
    var startingIndex = 0
    var visitedElementsCount = 0
    while visitedElementsCount < array.count {
        if startingIndex == 0, visitedElementsCount > 0 {
            return false
        }
        visitedElementsCount += 1
        startingIndex = nextVisitingIndex(in: array, after: startingIndex)
    }
    return startingIndex == 0
}


func nextVisitingIndex(in array: [Int], after index: Int) -> Int {
    let nextIndexToBe = (index + array[index]) % array.count
    if nextIndexToBe >= 0 {
        return nextIndexToBe
    } else {
        return nextIndexToBe + array.count
    }
}
