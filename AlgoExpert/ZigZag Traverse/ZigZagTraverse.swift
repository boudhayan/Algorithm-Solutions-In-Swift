//
//  ZigZagTraverse.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 08/08/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note: 
 */
func zigZagTraverse(array: [[Int]]) -> [Int] {
    var traversed = [Int]()
    var row = 0
    var col = 0
    let endRow = array.count - 1
    let endCol = array[0].count - 1
    var isGoingDown = true
    
    while row <= endRow, col <= endCol {
        traversed.append(array[row][col])
        if isGoingDown {
            if col == 0 || row == endRow {
                isGoingDown = false
                if row == endRow {
                    col += 1
                } else {
                    row += 1
                }
            } else {
                row += 1
                col -= 1
            }
        } else {
            if row == 0 || col == endCol {
                isGoingDown = true
                if col == endCol {
                    row += 1
                } else {
                   col += 1
                }
            } else {
                row -= 1
                col += 1
            }
        }
    }
    return traversed
}
