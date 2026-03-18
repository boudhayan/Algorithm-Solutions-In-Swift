//
//  MaxAreaOfIsland.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 01/10/21.
//

import Foundation

// 695 -> https://leetcode.com/problems/max-area-of-island/

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var maxArea = 0
    var grid = grid
    for i in stride(from: 0, to: grid.count, by: 1) {
        for j in stride(from: 0, to: grid[i].count, by: 1) {
            if grid[i][j] == 1 {
                var count = 0
                dfs(&grid, i, j, &count)
                maxArea = max(maxArea, count)
            }
        }
    }
    
    return maxArea
}
    
func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int, _ count: inout Int) {
    if i < 0 || i >= grid.count || j < 0 || j >= grid[i].count || grid[i][j] != 1 {
        return
    }
    
    count += 1
    grid[i][j] = 0
    dfs(&grid, i + 1, j, &count)
    dfs(&grid, i - 1, j, &count)
    dfs(&grid, i, j - 1, &count)
    dfs(&grid, i, j + 1, &count)
}
