//
//  PartitionLabels.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 01/10/21.
//

import Foundation

func partitionLabels(_ s: String) -> [Int] {
    guard !s.isEmpty else { return [] }
    var result = [Int]()
    var lastOccurenceDict: [Character: Int] = [:]
    let characters = Array(s)
    for idx in characters.indices {
        lastOccurenceDict[characters[idx]] = idx
    }
    var startIdx = 0
    var endIdx = 0
    for index in characters.indices {
        endIdx = max(endIdx, lastOccurenceDict[characters[index]]!)
        
        if index == endIdx {
            result.append(endIdx - startIdx + 1)
            startIdx = endIdx + 1
        }
    }
    return result
}
