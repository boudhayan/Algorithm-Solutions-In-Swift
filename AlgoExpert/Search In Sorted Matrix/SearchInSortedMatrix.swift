//
//  SearchInSortedMatrix.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 08/08/21.
//

import Foundation

/**
 Time Complexity: O(n + m)
 Space Complexity: O(1)
 Note:
 */
func searchInSortedMatrix(matrix: [[Int]], target: Int) -> [Int] {
    var row = 0
    var col = matrix[0].count - 1
    while row <= matrix.count - 1, col >= 0 {
        if matrix[row][col] > target {
            col -= 1
        } else if matrix[row][col] < target {
            row += 1
        } else {
            return [row, col]
        }
    }
    return [-1, -1]
}

