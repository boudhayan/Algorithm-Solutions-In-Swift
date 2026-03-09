//
//  ThreeSumZero.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/09/21.
//

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else { return [] }
    let array = nums.sorted()
    var triplets = [[Int]]()
    for idx in 0..<array.count - 2 {
        let first = array[idx]
        if idx > 0, array[idx] == array[idx - 1] {
            continue
        }
        var low = idx + 1
        var high = array.count - 1
        while low < array.count, high >= 0, low < high {
            let second = array[low]
            let third = array[high]
            let sum = first + second + third
            if sum == 0 {
                triplets.append([first, second, third])
                low += 1
                high -= 1
                while low < array.count, array[low] == array[low - 1] {
                    low += 1
                }
                while high >= 0, array[high] == third {
                    high -= 1
                }
            } else if sum > 0 {
                high -= 1
            } else {
                low += 1
            }
        }
    }
    return triplets
}
