//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/09/21.
//

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    var frequencies = [Character: Int]()
    var startIdx = -1
    var longestSubstringLength = 0
    for (endIdx, ch) in s.enumerated() {
        startIdx = max(frequencies[ch] ?? -1, startIdx)
        longestSubstringLength = max(longestSubstringLength, endIdx - startIdx)
        frequencies[ch] = endIdx
    }
    return longestSubstringLength
}
