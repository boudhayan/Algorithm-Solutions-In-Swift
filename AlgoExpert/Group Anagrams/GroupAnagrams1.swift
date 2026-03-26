//
//  GroupAnagrams1.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 14/04/22.
//

import Foundation

/**
 Time Complexity: O(w * n * log n)
 Space Complexity: O(w * n)
 Note: w is the number of words and n is the length of the longest word in the array
 */
func groupAnagramsAE(_ words: [String]) -> [[String]] {
    // Write your code here.
    var anagrams = [String: [String]]()
     for word in words {
         let sKey = String(word.sorted())
         if let existing = anagrams[sKey] {
             anagrams[sKey] = existing + [word]
         } else {
             anagrams[sKey] = [word]
         }
     }
     return Array(anagrams.values)
}

// without using sorting
/**
 Time Complexity: O(wn)
 Space Complexity: O(w)
 Note: not considering length of the longest word in calculating space complexity
 */
func groupAnagramsWithoutSorting(_ words: [String]) -> [[String]] {
    var anagrams = [[Int]: [String]]()
    for word in words {
        let anKey = generateKey(for: word)
        if let exisitingAnagrams = anagrams[anKey] {
            anagrams[anKey] = exisitingAnagrams + [word]
        } else {
            anagrams[anKey] = [word]
        }
    }
    return Array(anagrams.values)
}
func generateKey(for word: String) -> [Int] {
    // there are 26 letters in english alphabet
    var keyArray = Array(repeating: 0, count: 26)
    for char in word {
        let positionInAlphabet = Int(char.asciiValue! - Character("a").asciiValue!)
        keyArray[positionInAlphabet] += 1
    }
    return keyArray
}
