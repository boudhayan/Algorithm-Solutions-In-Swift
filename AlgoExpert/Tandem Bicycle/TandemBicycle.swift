//
//  TandemBicycle.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(nlogn)
 Space Complexity: O(1)
 Note: 
 */
func tandemBicycle(_ redShirtSpeeds: inout [Int], _ blueShirtSpeeds: inout [Int], _ fastest: Bool) -> Int {
    redShirtSpeeds.sort()
    blueShirtSpeeds.sort()
    if fastest {
        blueShirtSpeeds.reverse()
    }
    var totalSpeed = 0
    for idx in 0..<blueShirtSpeeds.count {
        totalSpeed += max(redShirtSpeeds[idx], blueShirtSpeeds[idx])
    }
    return totalSpeed
}
