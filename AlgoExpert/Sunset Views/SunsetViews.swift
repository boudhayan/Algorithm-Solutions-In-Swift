//
//  SunsetViews.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 27/06/22.
//

import Foundation

// T: O(n), S: O(n)
func sunsetViews(_ buildings: [Int], _ direction: String) -> [Int] {
    var tallest = Int(Int32.min)
    var results = [Int]()
    if direction == "EAST" {
        for idx in stride(from: buildings.count - 1, through: 0, by: -1) {
            let height = buildings[idx]
            if height > tallest {
                tallest = height
                results.append(idx)
            }
        }
    } else {
        for idx in stride(from: 0, through: buildings.count - 1, by: 1) {
            let height = buildings[idx]
            if height > tallest {
                tallest = height
                results.append(idx)
            }
        }
    }
    return direction == "EAST" ? results.reversed() : results
}

//let buildings = [3, 5, 4, 4, 3, 1, 3, 2]
//let direction = "EAST"
//print(sunsetViews(buildings, direction))
