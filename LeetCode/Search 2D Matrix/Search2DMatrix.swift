//
//  Search2DMatrix.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/04/22.
//

import Foundation

/**
 Question Link: https://leetcode.com/problems/search-a-2d-matrix/submissions/
 Time Complexity: O(log (M * N))
 Space Complexity: O(1)
 Note:
 */

func search2DMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var left = 0
    let m = matrix.count
    let n = matrix[0].count
    var right = m * n - 1
    while left <= right {
        let midIndex = (left + right) / 2
        let row = midIndex / n
        let column = midIndex % n
        if matrix[row][column] == target {
            return true
        } else if target < matrix[row][column] {
            right = midIndex - 1
        } else {
            left = midIndex + 1
        }
    }
    return false
}
