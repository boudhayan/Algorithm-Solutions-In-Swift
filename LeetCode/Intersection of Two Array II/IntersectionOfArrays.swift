//
//  IntersectionOfArrays.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/10/22.
//

import Foundation

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let first = nums1.sorted()
    let second = nums2.sorted()
    var l = 0, r = 0
    var common = [Int]()
    while l < first.count, r < second.count {
        if first[l] == second[r] {
            common.append(first[l])
            l += 1
            r += 1
            continue
        }
        if first[l] < second[r] {
            l += 1
        } else {
            r += 1
        }
    }
    return common
}
