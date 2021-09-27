//
//  Search2Dmatrix.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 27/09/21.
//

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let endRow = matrix.count - 1
    let endColumn = matrix[0].count - 1
    var currentRow = 0
    var currentColumn = 0
    while currentRow <= endRow, currentColumn <= endColumn {
        let rowArray = matrix[currentRow]
        var columnArray = [Int]()
        for r in 0...endRow {
            columnArray.append(matrix[r][currentColumn])
        }
        var lowRow = currentRow
        var highRow = endColumn
        var columnLow = currentColumn
        var columnHigh = endRow
        if target >= rowArray[lowRow], target <= rowArray[highRow] {
            // search in row array
            let result = binarySearch(array: rowArray, low: lowRow, high: highRow, target: target)
            if result {
                return true
            }
        }
        if target >= columnArray[columnLow], target <= columnArray[columnHigh] {
            // search in column array
            let result = binarySearch(array: columnArray, low: columnLow, high: columnHigh, target: target)
            if result {
                return true
            }
        }
        currentRow += 1
        currentColumn += 1
    }
    return false
}
    
func binarySearch(array: [Int], low: Int, high: Int, target: Int) -> Bool {
    guard low <= high else { return false }
    let mid = low + (high - low) / 2
    if array[mid] == target {
        return true
    } else if target < array[mid] {
        return binarySearch(array: array, low: low, high: mid - 1, target: target)
    } else {
        return binarySearch(array: array, low: mid + 1, high: high, target: target)
    }
}
