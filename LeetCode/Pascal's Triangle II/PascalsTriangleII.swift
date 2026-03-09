//
//  PascalsTriangleII.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 26/09/21.
//

import Foundation

func getRow(_ rowIndex: Int) -> [Int] {
    guard rowIndex > 0 else { return  [1] }
    var rowArray = Array(repeating: 0, count: rowIndex + 1)
    rowArray[0] = 1
    for idx in 1...rowIndex {
        var count = idx
        while count >= 1 {
            rowArray[count] += rowArray[count - 1]
            count -= 1
        }
    }
    return rowArray
}
