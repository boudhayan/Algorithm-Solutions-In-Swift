//
//  TwoNumberSumSortedArrray.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 26/09/21.
//

import Foundation

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1
    while left < right {
        let l1 = numbers[left]
        let r1 = numbers[right]
        let cs = l1 + r1
        if target > cs {
            left += 1
        } else if target < cs {
            right -= 1
        } else {
            return [left + 1, right + 1]
        }
    }
    return [-1, -1]
}
