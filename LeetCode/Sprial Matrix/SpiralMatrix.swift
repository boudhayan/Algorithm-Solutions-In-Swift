//
//  SpiralMatrix.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 01/04/22.
//

import Foundation

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var currentRow = 0
    var currentColumn = 0
    var endRow = matrix.count - 1
    var endColumn = matrix[0].count - 1
    var traversed = [Int]()
    while currentRow <= endRow, currentColumn <= endColumn {
        for column in stride(from: currentColumn, through: endColumn, by: 1) {
            traversed.append(matrix[currentRow][column])
        }
        for row in stride(from: currentRow + 1, through: endRow, by: 1) {
            traversed.append(matrix[row][endColumn])
        }
        for column in stride(from: endColumn - 1, through: currentColumn, by: -1) {
            if currentRow == endRow { break }
            traversed.append(matrix[endRow][column])
        }
        for row in stride(from: endRow - 1, through: currentRow + 1, by: -1) {
            if currentColumn == endColumn { break }
            traversed.append(matrix[row][currentColumn])
        }
        currentRow += 1
        currentColumn += 1
        endRow -= 1
        endColumn -= 1
    }
    return traversed
}
