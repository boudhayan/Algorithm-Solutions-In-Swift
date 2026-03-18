//
//  PowerSet.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/04/22.
//

import Foundation


func powerset(array: [Int], index: Int? = nil) -> [[Int]] {
    return powerSetHelper(array: array, index: 0, powerSets: [[]])
}
  
func powerSetHelper(array: [Int], index: Int, powerSets: [[Int]]) -> [[Int]] {
    if index == array.count { return powerSets }
    var sets = powerSets
    for s in powerSets {
        sets.append(s + [array[index]])
    }
    return powerSetHelper(array: array, index: index + 1, powerSets: sets)
}
