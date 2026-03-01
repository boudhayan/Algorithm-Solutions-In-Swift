//
//  ProductSum.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(d)
 Note: d is depth of the most nested array
 */
func productSum(_ array: [Any]) -> Int {
    return productSumHelper(array: array, multiplier: 1)
}

func productSumHelper(array: [Any], multiplier: Int) -> Int {
    var sum = 0
    for element in array {
        if element is Array<Any> {
            sum += productSumHelper(array: element as! [Any], multiplier: multiplier + 1)
        } else {
            sum += element as! Int
        }
    }
    return sum * multiplier
}
