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
    var aIdx = 0
    var sIdx = 0
    while aIdx < array.count, sIdx < sequence.count {
        guard sIdx != sequence.count else { break }
        if array[aIdx] == sequence[sIdx] {
            sIdx += 1
        }
        aIdx += 1
    }
    return sIdx == sequence.count
}
