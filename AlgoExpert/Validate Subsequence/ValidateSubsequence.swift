//
//  ValidateSubsequence.swift
//  Algorithms In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(N)
 Space Complexity: O(1)
 Note:
 */

func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
    var i = 0, j = 0
    while i < array.count, j < sequence.count {
        if array[i] == sequence[j] {
            j += 1
        }
        i += 1
    }
    return j == sequence.count
}
