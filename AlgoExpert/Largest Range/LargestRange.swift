//
//  LargestRange.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 04/08/21.
//

import Foundation

/**
 Time Complexity: O(nlogn)
 Space Complexity: O(1)
 Note: 
 */
func largestRange(array: [Int]) -> [Int] {
    let sortedNumbers = array.sorted()
    var rangeFound = false
    var start = -1
    var end = -1
    var rangeLength = 0
    var maxLength = -1
    var result = [Int]()
    guard array.count > 1 else { return [array[0], array[0]]}
    for idx in 1..<sortedNumbers.count {
        let diff = sortedNumbers[idx] - sortedNumbers[idx - 1]
        if diff == 1 {
            if rangeFound == false {
                rangeFound = true
                start = sortedNumbers[idx - 1]
                rangeLength += 1
            } else {
                rangeLength += 1
                end = sortedNumbers[idx]
            }
           
        }
        
        if diff != 1, diff != 0 {
            if rangeFound {
                end = sortedNumbers[idx - 1]
                if rangeLength > maxLength {
                    maxLength = rangeLength
                    result = [start, end]
                    rangeLength = 0
                    start = -1
                    end = -1
                }
            }
            rangeFound = false
        }
    }
    if rangeFound, rangeLength > maxLength {
        result = [start, sortedNumbers[sortedNumbers.count - 1]]
    }
    return result
}
