//
//  Subsets.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 02/04/22.
//

import Foundation

/**
 Question Link: https://leetcode.com/problems/subsets/
 Time Complexity: O(N.2^N)
 Space Complexity: O(N.2^N)
 Note:
 */

// Recursive Solution

func subsets(_ nums: [Int]) -> [[Int]] {
    var subs = [[Int]]()
    subs.append([])
    subsetsGenerator(from: nums, index: 0, subs: &subs)
    return subs
}

func subsetsGenerator(from array: [Int], index: Int, subs: inout [[Int]]) {
    if index == array.count { return }
    for idx in 0..<subs.count {
        subs.append(subs[idx] + [array[index]])
    }
   subsetsGenerator(from: array, index: index + 1, subs: &subs)
    
}


// Iterative Solution
func subsetsIterative(_ nums: [Int]) -> [[Int]] {
    var subs = [[Int]]()
    // create the default empty subset
    subs.append([])
    // iterate through each of the numbers
    for num in nums {
        // iterate through each of the subset and append the current number to each of the subset
        for sub in subs {
            subs.append(sub + [num])
        }
    }
    return subs
}
