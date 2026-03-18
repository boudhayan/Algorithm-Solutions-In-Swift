//
//  MaximumBagsFullCapacity.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/05/22.
//

import Foundation

func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
    var requiredRocks = [Int](repeating: 0, count: rocks.count)
    var extraRocks = additionalRocks
    var bagsCount = 0
    for idx in 0..<rocks.count {
        requiredRocks[idx] = capacity[idx] - rocks[idx]
    }
    requiredRocks.sort()
    for idx in 0..<requiredRocks.count {
        if requiredRocks[idx] == 0 {
            bagsCount += 1
            continue
        }
        if extraRocks < requiredRocks[idx] {
            break
        }
        extraRocks = extraRocks - requiredRocks[idx]
        bagsCount += 1
    }
    return bagsCount
}

