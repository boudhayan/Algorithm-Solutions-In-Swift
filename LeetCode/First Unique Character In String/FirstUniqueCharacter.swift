//
//  FirstUniqueCharacter.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/10/22.
//

import Foundation

func firstUniqChar(_ s: String) -> Int {
    var freq = [String: Int]()
    for char in s {
        if let c = freq["\(char)"] {
            freq["\(char)"] = c + 1
        } else {
            freq["\(char)"] = 1
        }
    }
    
    for (idx, char) in s.enumerated() {
        if freq["\(char)"]! == 1 {
            return idx
        }
        
    }
    return -1
}
