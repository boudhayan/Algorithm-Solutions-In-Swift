//
//  CountPairs.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 20/07/21.
//

import Foundation

func pairs(k: Int, arr: [Int]) -> Int {
    let array = arr.sorted()
    var pairCount = 0
    for idx in 0..<array.count {
        var visitingIdx = idx
        let elementToFind = array[visitingIdx] + k
        while visitingIdx < array.count {
            if array[visitingIdx] > elementToFind { break }
            if elementToFind == array[visitingIdx] {
                pairCount += 1
            }
            visitingIdx += 1
        }
    }
    return pairCount
}
