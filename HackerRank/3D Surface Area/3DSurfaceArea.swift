//
//  3DSurfaceArea.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 07/08/21.
//

import Foundation

/**
 Time Complexity: O(H * W)
 Space Complexity:  O(H * W)
 Note:  H is the number of rows and W is the number of columns
 */
func surfaceArea(A: [[Int]]) -> Int {
    var paddedSurface: [[Int]] = [Array(repeating: 0, count: A[0].count + 2)]
    for row in A {
        paddedSurface.append([0] + row + [0])
    }
    paddedSurface.append(Array(repeating: 0, count: A[0].count + 2))
    var area = 2 * A.count * A[0].count
    for row in 1..<paddedSurface.count - 1 {
        for col in 1..<paddedSurface[row].count - 1 {
            area += max(0, paddedSurface[row][col] - paddedSurface[row - 1][col])
            area += max(0, paddedSurface[row][col] - paddedSurface[row + 1][col])
            area += max(0, paddedSurface[row][col] - paddedSurface[row][col - 1])
            area += max(0, paddedSurface[row][col] - paddedSurface[row][col + 1])

        }
    }
    return area
}
