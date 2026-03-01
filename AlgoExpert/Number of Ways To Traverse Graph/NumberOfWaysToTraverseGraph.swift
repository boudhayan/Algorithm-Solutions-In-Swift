//
//  NumberOfWaysToTraverseGraph.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/07/22.
//

import Foundation

// T: O(wh), S: O(wh)
func numberOfWaysToTraverseGraph(_ width: Int, _ height: Int) -> Int {
    var ways = Array(repeating: Array(repeating: 0, count: width), count: height)
    ways[0][0] = 1
    for col in 1..<width {
        ways[0][col] = 1
    }
    
    for row in 1..<height {
        ways[row][0] = 1
    }
    
    for row in 1..<height {
        for col in 1..<width {
            ways[row][col] = ways[row - 1][col] + ways[row][col - 1]
        }
    }
    return ways[height - 1][width - 1]
}

