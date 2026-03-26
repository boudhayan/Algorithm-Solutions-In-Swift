//
//  MoveElementToEnd.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */
func moveElementToEnd(array: inout [Int], _ toMove: Int) -> [Int] {
    var firstIdx = 0
    var endIdx = array.count - 1
    while firstIdx < endIdx {
        if array[firstIdx] == toMove {
            while array[endIdx] == toMove, endIdx > firstIdx {
                endIdx -= 1
            }
            
            let temp = array[firstIdx]
            array[firstIdx] = array[endIdx]
            array[endIdx] = temp
            
        }
        firstIdx += 1
    }
    return array
}
