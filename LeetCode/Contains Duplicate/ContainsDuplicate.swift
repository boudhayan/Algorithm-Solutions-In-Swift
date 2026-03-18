//
//  ContainsDuplicate.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/10/22.
//

import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    var dict = [Int: Bool]()
    for num in nums {
        if let isExist = dict[num], isExist {
            return true
        } else {
            dict[num] = true
        }
    }
    return false
}
