//
//  ValidParentheses.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 31/03/22.
//

import Foundation

func isValid(_ s: String) -> Bool {
    guard s.count > 1 else { return false }
    var stack = [Character]()
    for bracket in s {
        if bracket == "]" || bracket == "}" || bracket == ")" {
            if stack.isEmpty { return false }
            let lastBracket = stack.removeLast()
            if (bracket == "]" && lastBracket != "[") || (bracket == "}" && lastBracket != "{") || (bracket == ")" && lastBracket != "(") {
                return false
            }
        } else {
            
            stack.append(bracket)
            
        }
    }
    return stack.isEmpty
}
