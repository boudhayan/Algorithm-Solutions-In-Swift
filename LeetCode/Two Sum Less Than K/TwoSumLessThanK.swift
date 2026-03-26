//
//  TwoSumLessThanK.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func twoSumLessThanK(_ nums: [Int], _ k: Int) -> Int {
    let numbers = nums.sorted()
    var i = 0, j = numbers.count - 1
    var maxSum = 0
    while i < j {
        let currentSum = numbers[i] + numbers[j]
        if currentSum < k {
            maxSum = max(maxSum, currentSum)
            i += 1
        } else {
            j -= 1
        }
    }
    return maxSum == 0 ? -1 : maxSum
}

//print(twoSumLessThanK([10, 20, 30], 15))
