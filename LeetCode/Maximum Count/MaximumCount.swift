//
//  MaximumCount.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func maximumCount(_ nums: [Int]) -> Int {
    if nums[0] > 0 || nums[nums.count - 1] < 0 { return nums.count }
    // get right most index for negative element
    var negativeRightIndex = -1
    var left = 0, right = nums.count - 1
    while left <= right {
        let mid = (left + right) / 2
        if nums[mid] < 0 {
            negativeRightIndex = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    print(negativeRightIndex)
    // get left most index for positive element
    var positiveRightIndex = -1
    left = negativeRightIndex + 1
    right = nums.count - 1
    while left < nums.count, left <= right {
        let mid = (left + right) / 2
        if nums[mid] > 0 {
            positiveRightIndex = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    print(positiveRightIndex)
    let negativeElements = negativeRightIndex == -1 ? 0 : negativeRightIndex - 0 + 1
    let positiveElements = positiveRightIndex == -1 ? 0 : nums.count - positiveRightIndex

    return max(negativeElements, positiveElements)
}
