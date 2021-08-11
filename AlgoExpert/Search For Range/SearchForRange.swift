//
//  SearchForRange.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 12/08/21.
//

import Foundation
/**
 Time Complexity: O(nlogn)
 Space Complexity: O(1)
 Note: 
 */
func searchForRange(_ array: [Int], _ target: Int) -> [Int] {
    let leftIndex = index(in: array, target: target, isLeftIndex: true)
    if leftIndex != array.count {
        return [leftIndex, index(in: array, target: target, isLeftIndex: false)]
    }
    return [-1, -1]
}

func index(in array: [Int], target: Int, isLeftIndex: Bool) -> Int {
    var left = 0
    var right = array.count - 1
    var leftMostIndex = array.count
    var rightMostIndex = 0
    while left <= right {
        let mid = (left + right) / 2
        if array[mid] == target {
            if isLeftIndex {
                if mid <= leftMostIndex {
                    leftMostIndex = mid
                }
                right = mid - 1
            } else {
                if mid >= rightMostIndex {
                    rightMostIndex = mid
                }
                left = mid + 1
            }
          
        } else if target < array[mid] {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return isLeftIndex ? leftMostIndex : rightMostIndex
}
