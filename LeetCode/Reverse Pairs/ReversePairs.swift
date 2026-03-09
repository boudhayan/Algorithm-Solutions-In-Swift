//
//  ReversePairs.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 03/03/26.
//

func reversePairs(_ nums: [Int]) -> Int {
    var arr = nums
    return mergeSort(&arr, low: 0, high: nums.count - 1)
}

func mergeSort(_ nums: inout [Int], low: Int, high: Int) -> Int {
    var count = 0
    if low >= high { return count }
    let mid = (low + high) / 2
    count += mergeSort(&nums, low: low, high: mid)
    count += mergeSort(&nums, low: mid + 1, high: high)
    count += countPairs(nums: nums, low: low, mid: mid, high: high)
    merge(nums: &nums, low: low, mid: mid, high: high)
    return count
}

func countPairs(nums: [Int], low: Int, mid: Int, high: Int) -> Int {
    var right = mid + 1
    var count = 0
    for i in low...mid {
        while right <= high, nums[i] > 2 * nums[right] {
            right += 1
        }
        count += right - (mid + 1)
    }
    return count
}

func merge(nums: inout [Int], low: Int, mid: Int, high: Int) {
    var i = low, j = mid + 1
    var temp = [Int]()
    while i <= mid, j <= high {
        if nums[i] < nums[j] {
            temp.append(nums[i])
            i += 1
        } else {
            temp.append(nums[j])
            j += 1
        }
    }
    while i <= mid {
        temp.append(nums[i])
        i += 1
    }
    while j <= high {
        temp.append(nums[j])
        j += 1
    }
    var k = low
    for i in 0..<temp.count {
        nums[k] = temp[i]
        k += 1
    }
}


//var arr = [2,4,3,5,1]
//print(reversePairs(arr))
