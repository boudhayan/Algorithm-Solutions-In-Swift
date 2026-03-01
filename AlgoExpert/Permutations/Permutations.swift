//
//  Permutations.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 20/04/22.
//

import Foundation

/**
 Time Complexity: O(N^2 * N!)
 Space Complexity: O(N * N!)
 Note: 
 */
func permutations(array: inout [Int]) -> [[Int]] {
    var permuttaions = [[Int]]()
    permutationHelper(array: array, permutations: &permuttaions, currentPermutation: [])
    return permuttaions
}

func permutationHelper(array: [Int], permutations: inout [[Int]], currentPermutation: [Int]) {
    if array.count == 0, currentPermutation.count > 0 {
        permutations.append(currentPermutation)
        return
    }
    for idx in 0..<array.count {
        var permutation = currentPermutation
        permutation.append(array[idx])
        var newArray = array
        newArray.remove(at: idx)
        permutationHelper(array: newArray, permutations: &permutations, currentPermutation: permutation)
    }
}
