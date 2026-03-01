//
//  ApartmentHunting.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/03/22.
//

import Foundation

// T: O(B^2R), S: O(1)
func apartmentHunting(_ blocks: [[String: Bool]], _ requirements: [String]) -> Int {
    var nearestIdx = -1
    var distance = Int(Int32.max)
    for idx in stride(from: 0, to: blocks.count, by: 1) {
        var maximumDistance = Int(Int32.min)
        for req in requirements {
            var minimumDistance = Int(Int32.max)
            for jdx in stride(from: 0, to: blocks.count, by: 1) {
                let block = blocks[jdx]
                if let isExist = block[req], isExist {
                    minimumDistance = min(minimumDistance, abs(jdx - idx))
                }
            }
            maximumDistance = max(maximumDistance, minimumDistance)
        }
        if maximumDistance < distance {
            distance = maximumDistance
            nearestIdx = idx
        }
    }
    return nearestIdx
}
