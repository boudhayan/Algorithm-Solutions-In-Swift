//
//  TwoNumberSum.swift
//  Algorithms In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(N)
 Space Complexity: O(N)
 Note:
 */
func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
    var dictionary = [Int: Bool]()
    for number in array {
        let remaining = targetSum - number
        if let _ = dictionary[remaining]  {
            return [number, remaining]
        } else {
            dictionary[number] = true
        }
    }
    return []
}
