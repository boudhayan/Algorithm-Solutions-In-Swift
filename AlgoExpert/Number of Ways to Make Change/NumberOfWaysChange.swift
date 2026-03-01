//
//  NumberOfWaysChange.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 28/06/22.
//

import Foundation

// T: O(n), S: O(n)
func numberOfWaysToMakeChange(target: Int, denominations: [Int]) -> Int {
    var ways = [Int](repeating: 0, count: target + 1)
    ways[0] = 1
    for denom in denominations {
        for idx in 1..<ways.count {
            let amount = idx
            if denom > amount {
                continue
            }
            ways[idx] = ways[idx] + ways[amount - denom]
            
        }
    }
    return ways[ways.count - 1]
}
