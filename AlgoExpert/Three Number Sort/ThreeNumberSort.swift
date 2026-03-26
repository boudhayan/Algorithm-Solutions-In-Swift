//
//  ThreeNumberSort.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */
func threeNumberSort(_ array: inout [Int], _ order: [Int]) -> [Int] {
    var oIdx = 0
    var leftIdx = 0
    var rightIdx = array.count - 1
    while oIdx < order.count {
        let orderElement = order[oIdx]
        while leftIdx <= rightIdx {
            if array[leftIdx] == orderElement {
                leftIdx += 1
                continue
            }
            if array[rightIdx] == orderElement {
                let temp = array[leftIdx]
                array[leftIdx] = array[rightIdx]
                array[rightIdx] = temp
            }
            rightIdx -= 1
        }
        rightIdx = array.count - 1
        oIdx += 1
    }
    return array
}
