//
//  SortStacks.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 28/06/22.
//

import Foundation

// T: O(n^2), S: O(n)
func sortStack(_ stack: inout [Int]) -> [Int] {
    if stack.count <= 1 {
        return stack
    }
    let first = stack.removeLast()
    sortStack(&stack)
    let second = stack.removeLast()
    if first < second {
        stack.append(first)
    } else {
        stack.append(second)
    }
    sortStack(&stack)
    if first > second {
        stack.append(first)
    } else {
        stack.append(second)
    }
    return stack
}
