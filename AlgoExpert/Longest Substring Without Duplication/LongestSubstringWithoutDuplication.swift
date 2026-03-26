//
//  LongestSubstringWithoutDuplication.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/04/22.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note:
 */

func longestSubstringWithoutDuplication(_ string: String) -> String {
    var start = 0
    var end = 0
    var length = -1
    var result = ""
    var lastSeenMap = [Character: Int]()
    for (idx, value) in string.enumerated() {
        
        if lastSeenMap[value] == nil {
            end = idx
        } else {
            start = max(lastSeenMap[value]! + 1, start)
            end = idx
        }
        lastSeenMap[value] = idx
        let cl = end - start + 1
        if cl > length {
            length = cl
            result = String(string[string.index(string.startIndex, offsetBy: start)...string.index(string.startIndex, offsetBy: idx)])
        }
    }
    return result
}
