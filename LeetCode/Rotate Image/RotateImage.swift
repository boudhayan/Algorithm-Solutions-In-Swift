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

func rotateImage1(_ matrix: inout [[Int]]) {
         var firstRow = 0
   var firstColumn = 0
   var lastRow = matrix.count - 1
   var lastColumn = matrix[0].count - 1
   let c = matrix.count - 1
   while firstRow < lastRow, firstColumn < lastColumn {
       // push first row values in last column
       var p = firstRow
       while p < lastRow {
           let temp = matrix[firstRow][p]
           matrix[firstRow][p] = matrix[p][lastColumn]
           matrix[p][lastColumn] = temp
           p += 1
       }
       
       // interchange first temp row with last row
       p = firstColumn
       var col = lastColumn
       while col >= firstColumn {
           let temp = matrix[lastRow][col]
           matrix[lastRow][col] = matrix[firstRow][p]
           matrix[firstRow][p] = temp
           col -= 1
           p += 1
       }
       
       // interchange first temp row with first column
       p = firstColumn
       var row = lastRow
       while row >= firstRow {
           let temp = matrix[row][firstColumn]
           matrix[row][firstColumn] = matrix[firstRow][p]
           matrix[firstRow][p] = temp
           row -= 1
           p += 1
       }
       firstRow += 1
       firstColumn += 1
       lastRow -= 1
       lastColumn -= 1

   }
   }
