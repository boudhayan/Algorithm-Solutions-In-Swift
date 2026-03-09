//
//  IncreasingTripletSubsequence.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/09/21.
//

import Foundation

func increasingTriplet(_ nums: [Int]) -> Bool {
    var first = Int(Int32.max)
    var second = Int(Int32.max)
    for num in nums {
        if num <= first {
            first = num
        } else if num <= second {
            second = num
        } else {
            return true
        }
    }
    return false
}
