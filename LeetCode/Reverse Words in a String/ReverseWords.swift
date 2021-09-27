//
//  ReverseWords.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 27/09/21.
//

import Foundation

func reverseWords(_ s: String) -> String {
    let array = s.components(separatedBy: " ")
    var reversed = [String]()
    for str in array {
        reversed.append(reverseString(str))
    }
    return reversed.joined(separator: " ")
}
   
func reverseString(_ s: String) -> String {
    guard s.count > 1 else { return s }
    var result = s.map { String($0) }
    var left = 0
    var right = result.count - 1
    while left <= right {
        result.swapAt(left, right)
        left += 1
        right -= 1
    }
    return result.joined(separator: "")
}
