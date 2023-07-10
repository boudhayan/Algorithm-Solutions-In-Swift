//
//  CloseStrings.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 10/07/23.
//

import Foundation

/* https://leetcode.com/problems/determine-if-two-strings-are-close/description/?envType=study-plan-v2&envId=leetcode-75
 */
func closeStrings(_ word1: String, _ word2: String) -> Bool {
    guard word1.count == word2.count else { return false }
    var wordOneHash = [Character: Int]()
    for char in word1 {
        wordOneHash[char] = wordOneHash[char, default: 0] + 1
    }
    var wordTwoHash = [Character: Int]()
    for char in word2 {
        wordTwoHash[char] = wordTwoHash[char, default: 0] + 1
    }
    
    var wordTwoCounts = Array(wordTwoHash.values)
    var wordTwoFreq = [Int: Int]()
    for value in wordTwoCounts {
        wordTwoFreq[value] = wordTwoFreq[value, default: 0] + 1
    }
    
    for (key, value) in wordOneHash {
        // both the string should have same charachters
        // the count of any char in first string, shoule be present in the second string also
        if wordTwoHash[key] == nil || wordTwoFreq[value] == nil {
            return false
        }
        wordTwoFreq[value] = wordTwoFreq[value]! - 1
    }
    for value in wordTwoFreq.values {
        if value > 0 {
            return false
        }
    }
    
    return true
}
