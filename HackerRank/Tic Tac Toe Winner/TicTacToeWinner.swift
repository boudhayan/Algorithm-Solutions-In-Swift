//
//  TicTacToeWinner.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 20/07/21.
//

import Foundation


func checkTicTacToeWinner(for moves: [[String]]) -> Bool {
    let rowRes =  checkForRowMatch(for: moves)
    let colRes = checkForColumnMatch(for: moves)
    let diagonalRes = checkForDiagonalMatch(for: moves)
    return rowRes || colRes || diagonalRes
}

fileprivate func checkForRowMatch(for moves: [[String]]) -> Bool {
    for row in 0..<3 {
        let firstMove = moves[row][0]
        var matchCount = 0
        for col in 0..<3 {
            if moves[row][col] == firstMove {
                matchCount += 1
            }
            if matchCount == 3 { return true }
        }
    }
    return false
}


fileprivate func checkForColumnMatch(for moves: [[String]]) -> Bool {
    for col in 0..<3 {
        let firstMove = moves[0][col]
        var matchCount = 0
        for row in 0..<3 {
            if moves[row][col] == firstMove {
                matchCount += 1
            }
            if matchCount == 3 { return true }
        }
    }
    return false
}


fileprivate func checkForDiagonalMatch(for moves: [[String]]) -> Bool {
    let firstDiagonalMove = moves[0][0]
    var matchCount = 0
    for idx in 0..<3 {
        if moves[idx][idx] == firstDiagonalMove {
            matchCount += 1
        }
        if matchCount == 3 { return true }
    }
    let secondDiagonalMove  = moves[0][2]
    var col = 2
    matchCount = 0
    for row in 0..<3 {
        if moves[row][col] == secondDiagonalMove {
            matchCount += 1
        }
        col -= 1
        if matchCount == 3 { return true }
    }
    return false
}
