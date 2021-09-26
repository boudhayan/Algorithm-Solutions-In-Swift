//
//  RotateImage.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 26/09/21.
//

import Foundation

func rotate(_ matrix: inout [[Int]]) {
    // Step 1: Flip vertically
    matrix.reverse()
    
    // Step 2: Flip diagonally
    for i in 0..<matrix.count {
        for j in 0..<i {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
        }
    }
}
