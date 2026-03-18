//
//  LargestRange.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 04/08/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note: 
 */
func largestRange(array: [Int]) -> [Int] {
    var dict = [Int: Bool]()
    // generate look up table
    // will make value as false if ever visited at the time of array enumeration
    for num in array {
        dict[num] = true
    }
    var range = Int(Int32.min)
    var result = [-1, -1]
    for num in array {
        // check whether previous and next number of current number exists in the dictionary
        var previous = num - 1
        var next = num + 1
        // start and end of the range is the current number, assign
        var start = num
        var end = num
        // find the smallest number in the range
        while let isExist = dict[previous], isExist {
            dict[previous] = false
            start = previous
            previous = previous - 1
        }
        // find the largest number in the range
        while let isExists = dict[next], isExists {
            dict[next] = false
            end = next
            next = next + 1
        }
        // check if current range is greater than the previous range
        if end - start > range {
            range = end - start
            result = [start, end]
        }
    }
    return result
}
