//
//  LarrysArray.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 20/07/21.
//

import Foundation

/**
 Time Complexity: O(N^2)
 Space Complexity: O(1)
 Note:
 */
func larrysArray(A: [Int]) -> String {
    let inversion = countInversion(in: A)
    if inversion % 2 == 0 {
        return "YES"
    }
    return "NO"
}

/*
 An inversion occurs when the a given value in an array precedes another value in the array.
 For instance, in an array of (random picks here): 3 1 4 5 6 2
 1 is preceded by higher value 3, so that's 1 inversion. 3, 4, 5, and 6 each precede the lower value 2, so that's 1 inversion each
 Formula: If the total number of inversions is even or divisible by 2, then the array can be sorted.
 By rotating a subarray of 3 elements we can change (decrease or increase) the numer of inversions in this subarray by 2 or by 0 only.
 1,2,3 (0) -> 2,3,1 (2) -> 3,1,2 (2) -> 1,2,3 (0)
 3,2,1 (3) -> 2,1,3 (1) -> 1,3,2 (1) -> 3,2,1 (3)
 As far as the number of inversions among the rest of array doesn't change, we can get 0 only if the number of inversions are even
 **/
fileprivate func countInversion(in array: [Int]) -> Int {
    var inversion = 0
    for idx in stride(from: array.count - 1, through: 0, by: -1) {
        let currentValue = array[idx]
        for jdx in stride(from: idx - 1, through: 0, by: -1) {
            if array[jdx] > currentValue {
                inversion += 1
            }
        }
    }
    return inversion
}


