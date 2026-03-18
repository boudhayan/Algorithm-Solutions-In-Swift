//
//  CountPairs.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func countPairs(_ nums: [Int], _ target: Int) -> Int {
    let numbers = nums.sorted()
    var left = 0, right = nums.count - 1
    var pairs = 0
    while left < right {
        let sum = numbers[left] + numbers[right]
        if sum < target {
            pairs += (right - left)
            left += 1
        } else {
            right -= 1
        }
    }
    return pairs
}
