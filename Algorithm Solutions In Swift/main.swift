//
//  main.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation
import CloudKit

var reds = [5, 5, 3, 9, 2]
var array = [1, 11, 3, 0, 15, 5, 2, 4, 10, 7, 12, 6]

func largestRange1(array: [Int]) -> [Int] {
    var dict = [Int: Bool]()
    for num in array {
        dict[num] = false
    }
    var range = [Int]()
    var length = 0
    
    for num in array {
        if dict[num] != nil, dict[num]! == false {
            // explore range
            // explore left
            var localMin = num
            var localMax = num
            var localLength = 1
            dict[num] = true
            var n = num
            while dict[n - 1] != nil {
                dict[n - 1] = true
                localMin = n - 1
                localLength += 1
                n -= 1
            }
            
            n  = num
            while dict[n + 1] != nil {
                dict[n + 1] = true
                localMax = n + 1
                localLength += 1
                n += 1
            }
            if localLength >= length {
                length = localLength
                range = [localMin, localMax]
            }
        }
    }
    return range
}

print(largestRange1(array: array))
