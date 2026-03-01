//
//  MergeStrings.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 01/08/23.
//

import Foundation

// Time complexity is O(m + n), as we iterate over word1 and word2 once.
// Space complexity is O(1), without considering the space consumed by the input strings and output string.
func mergeAlternately(_ word1: String, _ word2: String) -> String {
    var result = ""
    var i = 0, j = 0
    while i < word1.count || j < word2.count {
        if i < word1.count {
            let char1 = word1[word1.index(word1.startIndex, offsetBy: i)]
            result += "\(char1)"
        }
        if j < word2.count {
            let char2 = word2[word2.index(word2.startIndex, offsetBy: j)]
            result += "\(char2)"
        }
        i += 1
        j += 1
    }
    return result
}
