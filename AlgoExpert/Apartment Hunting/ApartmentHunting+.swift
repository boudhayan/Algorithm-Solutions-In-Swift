//
//  ApartmentHunting+.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/03/22.
//

import Foundation

// T: O(BR), S: O(BR)
func apartmentHunting1(_ blocks: [[String: Bool]], _ requirements: [String]) -> Int {
    var distances = [[Int]]()
    for idx in stride(from: 0, to: requirements.count, by: 1) {
        distances.append(findDistances(for: requirements[idx], blocks: blocks))
    }
    var minDistance = Int(Int32.max)
    var nearestIndex = -1
    for idx in stride(from: 0, to: distances[0].count, by: 1) {
        var maxDistance = Int(Int32.min)
        for rdx in stride(from: 0, to: requirements.count, by: 1) {
            maxDistance = max(maxDistance, distances[rdx][idx])
        }
        if maxDistance < minDistance {
            minDistance = maxDistance
            nearestIndex = idx
        }
    }
    
    return nearestIndex
}

func findDistances(for requirement: String, blocks: [[String: Bool]]) -> [Int] {
    var distances = Array(repeating: Int(Int32.min), count: blocks.count)
    var previous = Int(Int32.min)
    for idx in stride(from: 0, to: blocks.count, by: 1) {
        let block = blocks[idx]
        if let isReqExists = block[requirement], isReqExists {
            distances[idx] = 0
            previous = 0
        } else {
            if previous >= 0 {
                distances[idx] = distances[idx - 1] + 1
                previous = distances[idx]
            }
        }
    }
    
    for idx in stride(from: distances.count - 2, through: 0, by: -1) {
        if distances[idx] < 0 {
            distances[idx] = distances[idx + 1] + 1
        } else {
            distances[idx] = min(distances[idx + 1] + 1, distances[idx])
        }
    }
    return distances
}
