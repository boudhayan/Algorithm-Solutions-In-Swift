//
//  PlusOne.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/10/22.
//

import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    var nums = digits
    nums.reverse()
    var re = 0, carry = 0
    for i in 0..<nums.count {
        if i == 0 {
            re = nums[i] + 1
        } else {
            re = nums[i] + carry
        }
        carry = re/10
        nums[i] = re%10
    }
    if carry > 0 {
        nums.append(carry)
    }
    
    return Array(nums.reversed())
}
