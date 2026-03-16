//
//  IsMajorityElement.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func isMajorityElement(_ nums: [Int], _ target: Int) -> Bool {
    var left = 0, right = nums.count - 1
    var leftMostIndex = 0, rightMostIndex = 0
    while left <= right {
        let mid = (left + right) / 2
        if nums[mid] == target {
            leftMostIndex = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    left = leftMostIndex
    right = nums.count - 1
    while left <= right {
        let mid = (left + right) / 2
        if nums[mid] == target {
            rightMostIndex = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    let count = rightMostIndex - leftMostIndex + 1
    return count > nums.count / 2
}


//print(isMajorityElement([2, 5, 5]
//, 5))
