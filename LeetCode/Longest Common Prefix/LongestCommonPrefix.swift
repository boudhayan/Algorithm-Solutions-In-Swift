//
//  LongestCommonPrefix.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/10/22.
//

import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count > 1 else { return strs[0] }
    var longest = strs[0]
    for i in 1..<strs.count {
        longest = common(longest, strs[i])
    }
    return longest
}

func common(_ str1: String, _ str2: String) -> String {
    var i = str1.startIndex
    var j = str2.startIndex
    var longest = ""
    while i < str1.endIndex, j < str2.endIndex {
        let subStr1 = str1[str1.startIndex...i]
        let subStr2 = str2[str2.startIndex...j]
        if subStr1 == subStr2 {
            longest = String(subStr2)
        } else {
            return longest.count > 0 ? longest : ""
        }
        i = str1.index(after: i)
        j = str2.index(after: j)
    }
    return longest
}
