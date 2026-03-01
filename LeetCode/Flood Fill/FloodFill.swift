//
//  FloodFill.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 01/10/21.
//

import Foundation

// 733 -> https://leetcode.com/problems/flood-fill/

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    let floods = floodFilledCells(image, from: [sr, sc], color: image[sr][sc])
    var finalPositions = [[sr, sc]] + floods
    var idx = 1
    while idx < finalPositions.count {
        let position = finalPositions[idx]
        let newPositions = floodFilledCells(image, from: [position[0], position[1]], color: image[sr][sc])
        for pos in newPositions where !finalPositions.contains(pos) {
            finalPositions.append(pos)
        }
        idx += 1
    }
    var newImage = image
    for pos in finalPositions {
        newImage[pos[0]][pos[1]] = newColor
    }
    return newImage
}
    
func floodFilledCells(_ image: [[Int]], from pos: [Int], color: Int) -> [[Int]] {
    let row = image.count - 1
    let column = image[0].count - 1
    guard pos[0] >= 0, pos[0] <= row, pos[1] >= 0, pos[1] <= column else { return [] }
    let sr = pos[0]
    let sc = pos[1]
    let positions =  [[sr - 1, sc], [sr + 1, sc], [sr, sc - 1], [sr, sc + 1]]
    var result = [[Int]]()
    for position in positions {
        if position[0] >= 0, position[0] <= row, position[1] >= 0, position[1] <= column, image[position[0]][position[1]] == color {
            result.append(position)
        }
    }
    return result
}
