//
//  GenerateDocument.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/07/21.
//

import Foundation

func generateDocument(_ characters: String, _ document: String) -> Bool {
    var charFrequencies = [Character: Int]()
    for char in characters {
        charFrequencies[char, default: 0] += 1
    }
    
    for docChar in document {
        if let existingCount = charFrequencies[docChar], existingCount > 0 {
            charFrequencies[docChar] = existingCount - 1
        } else {
            return false
        }
    }
    return true
}
