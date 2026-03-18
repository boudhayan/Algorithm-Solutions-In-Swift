//
//  MoveZerosToEnd.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 26/09/21.
//

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    guard nums.count > 1 else { return }
    var idx = 0
    for j in 0..<nums.count {
        if nums[j] != 0 {
            nums[idx] = nums[j]
            idx += 1
        }
    }
    while idx < nums.count {
        nums[idx] = 0
        idx += 1
    }
}
