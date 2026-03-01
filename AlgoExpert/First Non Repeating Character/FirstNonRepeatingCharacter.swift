//
//  FirstNonRepeatingCharacter.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/07/21.
//

import Foundation
/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: space complexity is O(1) as the english alphabet has only 26 letters
 */
func firstNonRepeatingCharacter(_ string: String) -> Int {
    var dictionary = [Character: Int]()
    for ch in string {
        dictionary[ch, default: 0] += 1
    }
    for (idx, char) in string.enumerated() {
        if let count = dictionary[char], count == 1 {
            return idx
        }
    }
    return -1
}
