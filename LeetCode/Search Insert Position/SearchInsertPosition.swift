//
//  SearchInsertPosition.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/09/21.
//

import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if target < nums[mid] {
                high = mid - 1
            } else if target > nums[mid] {
                low = mid + 1
            } else {
                return mid
            }
        }
        
        let newTarget = target + 1
         low = 0
         high = nums.count
        while low < high {
            let mid = low + (high - low)/2
            if newTarget == nums[mid] {
                high = mid
            } else if newTarget > nums[mid] {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
