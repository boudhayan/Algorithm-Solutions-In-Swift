//
//  NthFibonacci.swift
//  Algorithms In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(2 ^ n)
 Space Complexity: O(n)
 Note: 
 */
func getNthFib(n: Int) -> Int {
    if n < 3 {
        return n - 1
    }
    return getNthFib(n: n - 1) + getNthFib(n: n - 2)
}

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note:
 */
func getNthFibUsingMemorization(n: Int) -> Int {
    var memorizationTable: [Int: Int] = [1: 0, 2: 1]
    return getNthFibUsingMemorizationHelper(n: n, memorizationTable: &memorizationTable)
}

func getNthFibUsingMemorizationHelper(n: Int, memorizationTable: inout [Int: Int]) -> Int {
    if let fibNumber = memorizationTable[n] {
        return fibNumber
    }
    memorizationTable[n] = getNthFibUsingMemorizationHelper(n: n - 1, memorizationTable: &memorizationTable) + getNthFibUsingMemorizationHelper(n: n - 2, memorizationTable: &memorizationTable)
    return memorizationTable[n, default: -1]
}
