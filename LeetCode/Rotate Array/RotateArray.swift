//
//  RotateArray.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/09/21.
//

import Foundation

func rotate(_ nums: inout [Int], _ k: Int) {
    guard nums.count > 1 else { return }
    let rc = k % nums.count
    reverse(start: 0, end: nums.count - 1, array: &nums)
    reverse(start: 0, end: rc - 1, array: &nums)
    reverse(start: rc, end: nums.count - 1, array: &nums)
}
    
func reverse(start: Int, end: Int, array: inout [Int]) {
    var s = start
    var e = end
    while s < e {
        array.swapAt(s, e)
        s += 1
        e -= 1
    }
}
