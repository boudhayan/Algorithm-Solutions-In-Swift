//
//  NextPermutation.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 03/03/26.
//

func nextPermutation(_ nums: inout [Int]) {
    var idx = -1
    let size = nums.count
    // traverse from n-2 to 0, to find where the break point where nums[i] < nums[i + 1]
    for i in stride(from: size - 2, through: 0, by: -1) {
        if nums[i] < nums[i + 1] {
            idx = i
            break
        }
    }
    // if there is no such index means next permutation is not possible, nums is already
    if idx == -1 {
        nums.reverse()
        return
    }
    for i in stride(from: size - 1, through: 0, by: -1) {
        if nums[i] > nums[idx] {
            nums.swapAt(i, idx)
            break
        }
    }
    reverse(&nums, from: idx + 1, to: size - 1)
}

//var arr = [2, 1, 5, 4, 3, 0, 0]
//nextPermutation(&arr)
