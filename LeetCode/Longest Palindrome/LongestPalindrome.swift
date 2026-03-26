//
//  LongestPalindromw.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/09/21.
//

import Foundation

// https://leetcode.com/problems/longest-palindromic-substring/

// T: O(N^2), S: O(N)
class LongestPalindome: Solution {
    func find(in s: String) -> String {
        guard s.count > 1 else { return s }
        var start = 0
        var end = 0
        let arr = Array(s)
        for idx in stride(from: 0, to: s.count - 1, by: 1) {
            let oddLength = checkPalindome(strs: arr, left: idx, right: idx)
            let evenLength = checkPalindome(strs: arr, left: idx, right: idx + 1)
            let length = max(oddLength, evenLength)
            if length > end - start {
                start = idx - ((length - 1)/2)
                end = idx + (length/2)
            }
            
        }
        return String(arr[start...end])
    }
    
    fileprivate func checkPalindome(strs: [Character], left: Int, right: Int) -> Int {
        var start = left
        var end = right
        while start >= 0, end < strs.count, strs[start] == strs[end] {
            start -= 1
            end += 1
        }
        return end - start - 1
    }
}

