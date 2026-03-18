//
//  SortByParity.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/05/22.
//

import Foundation

func sortArrayByParity(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else { return nums }
    var numbers = nums
    var start = 0
    var end = nums.count - 1
    while start < end {
        while end >= 0, numbers[end] % 2 == 1 {
            end -= 1
        }
        
        while start < numbers.count, numbers[start] % 2 == 0 {
            start += 1
        }
        
        if start < end {
            numbers.swapAt(start, end)
            start += 1
        }
        end -= 1
    }
    
    return numbers
}

