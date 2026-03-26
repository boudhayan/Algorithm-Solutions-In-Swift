//
//  FindPeakElementArray.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 26/03/26.
//

func findPeakElement(_ nums: [Int]) -> Int {
    var left = 0, right = nums.count - 1
    while left >= 0, right < nums.count, left <= right {
        let mid = (left + right) / 2
        if isPeak(idx: mid) {
            return mid
        } else if mid > 0, nums[mid] < nums[mid - 1] {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return 0

    func isPeak(idx: Int) -> Bool {
        let isGreaterThanLeftNeighbour = idx == 0 ? true : nums[idx - 1] < nums[idx]
        let isGreaterThanRightNeighbour = idx == nums.count - 1 ? true : nums[idx + 1] < nums[idx]
        return isGreaterThanLeftNeighbour && isGreaterThanRightNeighbour
    }
}


//print(findPeakElement([1,2]))
