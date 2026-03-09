//
//  FirstDuplicateValue.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/07/21.
//

import Foundation

/**
 Time Complexity: O(N)
 Space Complexity: O(1)
 Note:
 */

func firstDuplicateValue(_ array: inout [Int]) -> Int {
    for num in array {
        let index = abs(num) - 1
        if array[index] < 0 {
            return num
        }
        array[index] = -array[index]
        
    }
    return -1
}
