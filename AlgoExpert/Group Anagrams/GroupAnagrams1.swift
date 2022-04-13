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
    var dict = [[Int]: [String]]()
    for word in words {
        let characters = Array(word)
        var characterMapkey = Array(repeating: 0, count: 26)
        for char in characters {
            let position = Int(char.asciiValue! - Character("a").asciiValue!)
            characterMapkey[position] = characterMapkey[position] + 1
        }
        if let anagrams = dict[characterMapkey] {
            dict[characterMapkey] = anagrams + [word]
        } else {
            dict[characterMapkey] = [word]
        }
    }
    return Array(dict.values)
}
