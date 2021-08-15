//
//  ReverseString.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 15/08/21.
//

import Foundation

func reverseString(string: String) -> String {
    return reverse(string: string, index: string.startIndex)
}

func reverse(string: String, index: String.Index) -> String {
    if index == string.endIndex {
        return ""
    }
    return reverse(string: string, index: value.index(index, offsetBy: 1)) + String(string[index])
}
