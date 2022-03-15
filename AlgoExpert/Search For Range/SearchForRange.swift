//
//  SearchForRange.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 12/08/21.
//

import Foundation
/**
 Time Complexity: O(logn)
 Space Complexity: O(1)
 Note: 
 */

func searchRange(array: [Int], target: Int) -> [Int] {
    var left = -1
    var right = -1
    var start = 0
    var end = array.count - 1
    
    // find left index
    while start <= end {
        let mid = start + (end - start) / 2
        // check if mid element is equal to target
        if array[mid] == target {
            if mid == start || array[mid - 1] < target {
                left = mid
                break
            } else {
                end = mid - 1
            }
        } else if array[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    if left == -1 { return [-1, -1] }
    // find right index
    start = left
    end = array.count - 1
    print(start)
    while start <= end {
        let mid = start + (end - start) / 2
        if array[mid] == target {
            if mid == end || array[mid + 1] > target {
                right = mid
                break
            } else {
                start = mid + 1
            }
        } else if array[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return [left, right]
}
