//
//  SetZeros.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 28/02/26.
//

//Problem Link: https://leetcode.com/problems/set-matrix-zeroes/

func setZeroes(_ matrix: inout [[Int]]) {
    var rows = Array(repeating: false, count: matrix.count)
    var columns = Array(repeating: false, count: matrix[0].count)

    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if matrix[i][j] == 0 {
                rows[i] = true
                columns[j] = true
            }
        }
    }

    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if rows[i] == true || columns[j] == true {
                matrix[i][j] = 0
            }
        }
    }
}
