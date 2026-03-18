//
//  SpiralMatrix.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 26/09/21.
//

import Foundation

func generateMatrix(_ n: Int) -> [[Int]] {
    var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
    var startRow = 0
    var startColumn = 0
    var endColumn = matrix.count - 1
    var endRow = matrix[0].count - 1
    var latest = 1
    while startRow <= endRow, startColumn <= endColumn {
        for col in stride(from: startColumn, through: endColumn, by: 1) {
            matrix[startRow][col] = latest
            latest += 1
        }
        for row in stride(from: startRow + 1, through: endRow, by: 1) {
            matrix[row][endColumn] = latest
            latest += 1
        }
        for col in stride(from: endColumn - 1, through: startColumn, by: -1) {
            matrix[endRow][col] = latest
            latest += 1
        }
        for row in stride(from: endRow - 1, through: startRow + 1, by: -1) {
            matrix[row][startColumn] = latest
            latest += 1
        }
        startRow += 1
        endRow -= 1
        startColumn += 1
        endColumn -= 1
    }
    return matrix
}
