//
//  BuildMatrixWithCondition.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/07/24.
//

import Foundation

func buildMatrix(_ k: Int, _ rowConditions: [[Int]], _ colConditions: [[Int]]) -> [[Int]] {
    var matrix = [[Int]](repeating: [Int](repeating: 0, count: k), count: k)
    guard let rows = Graph(nodes: Array(1...k), edges: rowConditions).topologicalSort() else { return [] }
    guard let columns = Graph(nodes: Array(1...k), edges: colConditions).topologicalSort() else { return [] }
    for num in 1...k {
        guard let row = rows.firstIndex(of: num), let col = columns.firstIndex(of: num) else { continue }
        matrix[row][col] = num
    }
    return matrix
}
