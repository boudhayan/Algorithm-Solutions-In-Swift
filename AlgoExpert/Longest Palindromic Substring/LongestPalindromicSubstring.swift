//
//  LongestPalindromicSubstring.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 13/08/21.
//

import Foundation
/**
 Time Complexity: O(N^2)
 Space Complexity: O(N)
 Note: 
 */
func longestPalindromicSubstring(string: String) -> String {
    let strs = Array(string)
    var maxLength = Int(Int32.min)
    var indices = [0, 0]
    // start with 0 index, check for every possible odd and even palidrome string, starting with idx
    for idx in 0..<string.count - 1 {
        // check for possible odd palidrome center at idx
        let oddLength = expandToCheckPalindromeLength(strs, firstIndex: idx, secondIndex: idx)
        // check for possible even palindrome center at idx, idx + 1
        let evenLength = expandToCheckPalindromeLength(strs, firstIndex: idx, secondIndex: idx + 1)
        let localMaxLength = max(oddLength, evenLength)
        if localMaxLength > maxLength {
            maxLength = localMaxLength
            /**
             if palidrome string length is 'len' and center is idx
             then startingIndex = idx - (len - 1) / 2
                   endingIndex = idx + len/2
             */
            let startOfPalindrome = idx - (localMaxLength - 1) / 2
            let endOfPalidrome = idx + localMaxLength / 2
            indices = [startOfPalindrome, endOfPalidrome]
        }
    }
    
    return String(strs[indices[0]...indices[1]])
}

/**
  Starting with center, expand in left and right direction to find the palindrome
 for odd length palindrome, center will be single point
 for even length palindrome, center is center and center + 1
*/
func expandToCheckPalindromeLength(_ strs: [Character], firstIndex: Int, secondIndex: Int) -> Int {
    var start = firstIndex
    var end = secondIndex
    while start >= 0, end < strs.count, strs[start] == strs[end] {
        start -= 1
        end += 1
    }
    return end - start - 1
}
