//
//  PalindromeString.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 15/08/21.
//

import Foundation

func isPalindromeString(_ string: String) -> Bool {
    return isPalindromeHelper(string: string, firstIndex: string.startIndex, lastIndex: string.index(before: string.endIndex))
}


func isPalindromeHelper(string: String, firstIndex: String.Index, lastIndex: String.Index) -> Bool {
    if firstIndex == lastIndex {
        return true
    }
    
    if string[firstIndex] == string[lastIndex] {
        return isPalindromeHelper(string: string, firstIndex: string.index(after: firstIndex), lastIndex: string.index(before: lastIndex))
    }
    
    return false
}
