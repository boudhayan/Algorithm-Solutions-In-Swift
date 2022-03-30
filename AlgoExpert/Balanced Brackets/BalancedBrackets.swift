//
//  BalancedBrackets.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 31/03/22.
//

import Foundation

// T: O(N), S: O(N)
func balancedBrackets(string: String) -> Bool {
    guard string.count > 1 else { return false }
    var stack = [Character]()
    for (idx, char) in string.enumerated() {
        if char == ")" || char == "}" || char == "]" {
            if idx == 0 { return false }
            let lastBracket = stack.removeLast()
            if (char == ")" && lastBracket != "(") || (char == "}" && lastBracket != "{") || (char == "]" && lastBracket != "["){
                return false
            }
            
        } else if char == "(" || char == "{" || char == "[" {
            stack.append(char)
        }
    }
    return stack.isEmpty
}
