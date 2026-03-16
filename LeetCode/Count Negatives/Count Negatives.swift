//
//  Count Negatives.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func countNegatives(_ grid: [[Int]]) -> Int {
    var count = 0
    for row in grid {
        var left = 0, right = row.count - 1
        var negativeIndex = -1
        while left <= right {
            let mid = (left + right) / 2
            if row[mid] < 0 {
                negativeIndex = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        count += negativeIndex == -1 ? 0 : (row.count - negativeIndex)
    }
    return count
}

//let grid = [[3, 2], [1, 0]]
//print(countNegatives(grid))
