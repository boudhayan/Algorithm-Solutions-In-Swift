//
//  ValidSuduku.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/10/22.
//

import Foundation

func isValidSudoku(_ board: [[Character]]) -> Bool {
    return hasValidRows(board) && hasValidColumns(board) && hasValidNestedBlocks(board)
}

func hasValidRows( _ board: [[Character]]) -> Bool {
    for row in 0..<board.count {
        var seen = Set<Character>()
        for col in 0..<board[0].count {
            if board[row][col] != ".", seen.insert(board[row][col]).inserted == false {
                return false
            }
        }
    }
    return true
}

func hasValidColumns( _ board: [[Character]]) -> Bool {
    for col in 0..<board[0].count {
        var seen = Set<Character>()
        for row in 0..<board.count {
            if  board[row][col] != ".", seen.insert(board[row][col]).inserted == false {
                return false
            }
        }
    }
    return true
}

func hasValidNestedBlocks(_ board: [[Character]]) -> Bool {
    var startRow = 0
    var startCol = 0
    while startRow < board.count - 2 {
        var row = startRow
        startCol = 0
        while startCol < board[0].count - 2 {
            var col = startCol
            var seen = Set<Character>()
            var endRow = row + 3, endCol = col + 3
            for i in startRow..<endRow {
                for j in startCol..<endCol {
                    if  board[i][j] != ".", seen.insert(board[i][j]).inserted == false {
                        return false
                    }
                }
            }
            startCol += 3
        }
        startRow += 3
    }
    return true
}
