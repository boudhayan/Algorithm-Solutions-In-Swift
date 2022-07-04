//
//  RemoveIslands.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 04/07/22.
//

import Foundation

// T: O(mn), S: (mn)
func removeIslands(_ matrix: inout [[Int]]) -> [[Int]] {
    // go through the border and find 1.
    // if found 1, try to come inside and make every adjacent 1's to 2's
    //connected border 1's will be 2's
    // islands 1 will still exist as a
    // iterate through matrix
    // change 2 to 1 and 1 to 0
    for row in 0..<matrix.count {
        for col in 0..<matrix[0].count {
            if !isBorder(row, col, matrix) {
                continue
            }
            if row == 1 && col == 5 {
                print("")
            
            if matrix[row][col] == 0 || matrix[row][col] == 2 {
                continue
            }
        }
            changeBorderOnesToTwos(row, col, &matrix)
        }
    }
    
    for row in 0..<matrix.count {
        for col in 0..<matrix[0].count {
            if matrix[row][col] == 2 {
                matrix[row][col] = 1
            } else if matrix[row][col] == 1 {
                matrix[row][col] = 0
            } else {
                
            }
        }
    }
    return matrix
}

func isBorder(_ row: Int, _ col: Int, _ matrix: [[Int]]) -> Bool {
    return row == 0 || col == 0 || row == matrix.count - 1 || col == matrix[0].count - 1
}

func changeBorderOnesToTwos(_ row: Int, _ col: Int, _ matrix: inout [[Int]]) {
    var stack = [(Int, Int)]()
    stack.append((row, col))
    while !stack.isEmpty {
        let (r, c) = stack.removeLast()
        if matrix[r][c] == 0 || matrix[r][c] == 2 {
            continue
        }
        matrix[r][c] = 2
        stack += validNeighbours(r, c, matrix)
    }
}


func validNeighbours(_ row: Int, _ col: Int, _ matrix: [[Int]]) -> [(Int, Int)] {
    var neighbours = [(Int, Int)]()
    if row - 1 >= 0  {
        neighbours.append((row - 1, col))
    }
    if row + 1 <= matrix.count - 1 {
        neighbours.append((row + 1, col))
    }
    if col - 1 >= 0 {
        neighbours.append((row, col - 1))
    }
    if col + 1 <= matrix[0].count - 1 {
        neighbours.append((row, col + 1))
    }
    return neighbours
}

//var matrix = [
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//    [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//  ]
//print(removeIslands(&matrix))
//
///**
// [
// [2, 0, 0, 0, 0, 0],
// [0, 1, 0, 2, 2, 2],
// [0, 0, 1, 0, 2, 0],
// [2, 2, 0, 0, 2, 0],
// [2, 0, 1, 1, 0, 0],
// [2, 0, 0, 0, 0, 2]
// ]
//
//
// */
