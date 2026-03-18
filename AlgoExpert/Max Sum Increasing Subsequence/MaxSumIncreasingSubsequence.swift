//
//  MaxSumIncreasingSubsequence.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/07/22.
//

import Foundation

// T: O(n^2), S: O(n)
func maximumSumIncreasingSubsequence(array: [Int]) -> (Int, [Int]) {
    var sums = array
    var previousIndices: [Int?] = Array(repeating: nil, count: array.count)
    var maxSumIndex = 0
    for i in 0..<array.count {
        let currentNumber = array[i]
        for j in 0..<i {
            let previousNumber = array[j]
            if previousNumber < currentNumber, sums[j] + currentNumber > sums[i] {
                sums[i] = sums[j] + currentNumber
                previousIndices[i] = j
            }
        }
        if sums[i] > sums[maxSumIndex] {
            maxSumIndex = i
        }
    }
    return (sums[maxSumIndex],buildSequence(indices: previousIndices, maxSumIndex: maxSumIndex, array: array))
}

func buildSequence(indices: [Int?], maxSumIndex: Int, array: [Int]) -> [Int] {
    var sequence = [Int]()
    var currentIndex: Int? = maxSumIndex
    while let idx = currentIndex {
        sequence.insert(array[idx], at: 0)
        currentIndex = indices[idx]
    }
    return sequence
}
