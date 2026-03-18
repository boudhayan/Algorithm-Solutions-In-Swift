//
//  BalancedBrackets.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 31/03/22.
//

import Foundation

// T: O(N), S: O(N)
func balancedBrackets(string: String) -> Bool {
    var stack = [Character]()
    for char in string {
        if char == ")" || char == "}" || char == "]" {
            let lastBracket = pop(&stack)
            if lastBracket != openingBracket(for: char) {
                return false
            }
        } else {
            _ = push(char, &stack)
        }
    }
    return stack.isEmpty
}

func push(_ char: Character, _ stack: inout [Character]) -> Bool {
    if char == "(" || char == "{" || char == "[" {
        stack.append(char)
        return true
    }
    return false
}

func pop(_ stack: inout [Character]) -> Character? {
    guard !stack.isEmpty else { return nil }
    return stack.removeLast()
}

func openingBracket(for bracket: Character) -> Character {
    if bracket == ")" {
        return "("
    } else if bracket == "}" {
        return "{"
    } else if bracket == "]" {
        return "["
    } else {
        // this should not come here
    }
    return "."
}
