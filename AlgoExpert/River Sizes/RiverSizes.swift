//
//  RiverSizes.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 27/06/22.
//

import Foundation

// T: O(mn), S: O(mn)
func riverSizes(_ matrix: [[Int]]) -> [Int] {
    var sizes = [Int]()
    var rivers = matrix
    for row in 0..<matrix.count {
        for column in 0..<matrix[0].count {
            if matrix[row][column] == 0 || matrix[row][column] == 2 {
                continue
            }
            // river part found
            if isValidPos((row, column), rivers) {
                rivers[row][column] = 2
                sizes.append(getRiverSize(row: row, column: column, matrix: &rivers))
            }
       
        }
    }
    return sizes
}

func getRiverSize(row: Int, column: Int, matrix: inout [[Int]]) -> Int {
    var queue = [(Int, Int)]()
    queue.append((row, column))
    var size = 0
    while !queue.isEmpty {
        let (r, c) = queue.removeFirst()
        size += 1
        // next possible four index
        let pos1 = (r - 1, c)
        let pos2 = (r + 1, c)
        let pos3 = (r, c - 1)
        let pos4 = (r, c + 1)
        if isValidPos(pos1, matrix) {
            queue.append(pos1)
            matrix[pos1.0][pos1.1] = 2
        }
        if isValidPos(pos2, matrix) {
            queue.append(pos2)
            matrix[pos2.0][pos2.1] = 2
        }
        if isValidPos(pos3, matrix) {
            queue.append(pos3)
            matrix[pos3.0][pos3.1] = 2
        }
        if isValidPos(pos4, matrix) {
            queue.append(pos4)
            matrix[pos4.0][pos4.1] = 2
        }
        
    }
    return size
}

func isValidPos(_ pos: (Int, Int), _ matrix: [[Int]]) -> Bool {
    let (r, c) = pos
    if r < 0 || c < 0 {
        return false
    }
    if r > matrix.count - 1 || c > matrix[0].count - 1 {
        return false
    }
    return matrix[r][c] == 1
}


//var matrix = [
//    [1, 0, 0, 1, 0],
//    [1, 0, 1, 0, 0],
//    [0, 0, 1, 0, 1],
//    [1, 0, 1, 0, 1],
//    [1, 0, 1, 1, 0]
//  ]
//print(riverSizes(matrix))
