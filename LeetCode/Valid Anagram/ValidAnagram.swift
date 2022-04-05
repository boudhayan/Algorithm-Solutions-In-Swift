//
//  ValidAnagram.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 05/04/22.
//

import Foundation

/**
 Question Link: https://leetcode.com/problems/valid-anagram/
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note: 
 */

func isAnagram(_ s: String, _ t: String) -> Bool {
    var dict = [Character: Int]()
    for char in s {
        if let count = dict[char] {
            dict[char] = count + 1
        } else {
            dict[char] = 1
        }
    }
    
    for char in t {
        if dict[char] == nil {
            return false
        }
        if let count = dict[char] {
            if count == 1 {
                dict[char] = nil
            } else {
                dict[char] = count - 1
            }
        }
    }
    return dict.isEmpty
}
