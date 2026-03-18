//
//  PalindromeCheck.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */
func isPalindrome(string: String) -> Bool {
    var start = 0
    var end = string.count - 1
    while start <= end {
        if string[string.index(string.startIndex, offsetBy: start)] != string[string.index(string.startIndex, offsetBy: end)] {
            return false
        }
        start += 1
        end -= 1
    }
    return true
}
