//
//  ClassPhotos.swift
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
func classPhotos(_ redShirtHeights: inout [Int], _ blueShirtHeights: inout [Int]) -> Bool {
    redShirtHeights.sort()
    blueShirtHeights.sort()
    let redInTheBackRow = redShirtHeights[0] > blueShirtHeights[0]
    if redInTheBackRow {
        for idx in 0..<redShirtHeights.count where blueShirtHeights[idx] >= redShirtHeights[idx] {
            return false
        }
    } else {
        for idx in 0..<blueShirtHeights.count where redShirtHeights[idx] >= blueShirtHeights[idx] {
            return false
        }
    }
    return true
}
