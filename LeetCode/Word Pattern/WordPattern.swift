//
//  WordPattern.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 01/10/21.
//

import Foundation

func wordPattern(_ pattern: String, _ s: String) -> Bool {
    let patterns = Array(pattern)
    let words: [String] = s.components(separatedBy: " ")
    var hashmap: [String: Character] = [:]
    guard patterns.count == words.count else { return false }
    
    guard Set(words).count == Set(patterns).count else { return false }
    for idx in 0..<patterns.count {
        let ch = words[idx]
        if let existingVal = hashmap[ch] {
            if patterns[idx] != existingVal {
                return false
            }
        } else {
            hashmap[ch] = patterns[idx]
        }
    }
    
    return true
}
