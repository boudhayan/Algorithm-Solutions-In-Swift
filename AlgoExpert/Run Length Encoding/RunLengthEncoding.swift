//
//  RunLengthEncoding.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note: 
 */
func runLengthEncoding(_ string: String) -> String {
    var encodedValue = ""
    var count = 1
    for idx in 1..<string.count {
        if count == 9 || string[string.index(string.startIndex, offsetBy: idx)] != string[string.index(string.startIndex, offsetBy: idx - 1)] {
            encodedValue += "\(count)\(string[string.index(string.startIndex, offsetBy: idx - 1)])"
            count = 0
        }
        count += 1
    }
    encodedValue += "\(count)\(string[string.index(string.startIndex, offsetBy: string.count - 1)])"
    
    return encodedValue
}
