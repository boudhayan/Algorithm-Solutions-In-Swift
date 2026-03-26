//
//  SortColors.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/09/21.
//

import Foundation

func sortColors(_ nums: inout [Int]) {
    let k = customSort(for: 0, low: 0, in: &nums)
    customSort(for: 1, low: k, in: &nums)
}

@discardableResult func customSort(for element: Int, low: Int, in nums: inout [Int]) -> Int {
    var  s = low
    var e = nums.count - 1
    while s < e {
        if nums[s] == element {
            s += 1
        } else if nums[e] == element {
            guard s < e else { break }
            nums.swapAt(s, e)
            s += 1
        } else {
            while e > 0, nums[e] != element {
                e -= 1
            }
            guard s < e, e > 0 else { break }
            nums.swapAt(s, e)
            s += 1
        }
    }
    return s
}
