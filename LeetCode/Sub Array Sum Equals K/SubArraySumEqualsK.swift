//
//  SubArraySumEqualsK.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/09/21.
//

import Foundation

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var count = 0
    var dict = [Int: Int]()
    guard nums.count > 0 else { return 0 }
    var currentSum = 0
    dict[0] = 1
    for idx in 0..<nums.count {
        currentSum += nums[idx]
        let remaining = currentSum - k
        if dict[remaining] != nil {
            count += dict[remaining]!
        }
        if let ocCount = dict[currentSum] {
            dict[currentSum] = ocCount + 1
        } else {
            dict[currentSum] = 1
        }
        
    }
    return count
}
