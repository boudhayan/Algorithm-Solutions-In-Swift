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
 Note: where n is the total number of nodes
 */
func zigZagTraverse(array: [[Int]]) -> [Int] {
    var values = [Int]()
    // `isDown` tells whether we are going down or not
    var isDown = true
    let endRow = array.count - 1
    let endColumn = array[0].count - 1
    let startRow = 0
    let startColumn = 0
    var cRow = 0
    var cColumn = 0
    while cRow <= endRow, cColumn <= endColumn {
        // in one iteration we will visit only one element
        values.append(array[cRow][cColumn])
        // check whether we are going down
        if isDown {
            // if current row is equal to end row or current column is equal to end column, then we have to change the direction, and we have to go up
            if cRow == endRow || cColumn == startColumn {
                // this check has priority over the else check, as it will increment side ways (in column)
                if cRow == endRow {
                    cColumn += 1
                } else {
                    cRow += 1
                }
                isDown  = false
            } else {
                cRow += 1
                cColumn -= 1
            }
        } else {
            if cColumn == endColumn || cRow == startRow {
                // this check has higher priority over the else check, as it will increment down ways (in rows)
                if cColumn == endColumn {
                    cRow += 1
                } else {
                    cColumn += 1
                }
                isDown = true
            } else {
                cRow -= 1
                cColumn += 1
            }
        }
    }
    return values
}
