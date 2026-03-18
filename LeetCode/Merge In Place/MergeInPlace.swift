//
//  MergeInPlace.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 03/03/26.
//

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m - 1, j = n - 1
    var k = nums1.count - 1
    while i >= 0, j >= 0 {
        if nums1[i] > nums2[j] {
            nums1[k] = nums1[i]
            i -= 1
        } else {
            nums1[k] = nums2[j]
            j -= 1
        }
        k -= 1
    }
    while i >= 0 {
        nums1[k] = nums1[i]
        i -= 1
        k -= 1
    }
    while j >= 0 {
        nums1[k] = nums2[j]
        j -= 1
        k -= 1
    }
}

//var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
//merge(&nums1, m, nums2, n)
//print(nums1)
