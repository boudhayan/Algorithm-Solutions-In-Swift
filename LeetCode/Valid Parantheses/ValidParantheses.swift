//
//  ValidParantheses.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/10/22.
//

import Foundation

fileprivate class Stack {
    private var arr = [String]()
    
    func push(_ string: String) {
        arr.append(string)
    }
    
    func pop() -> String {
        return arr.removeLast()
    }
    
    var isEmpty: Bool {
        return arr.isEmpty
    }
}

fileprivate func isValid(_ s: String) -> Bool {
    var stack = Stack()
    for char in s {
        let val = "\(char)"
        if val == "(" || val == "{"  || val == "[" {
            stack.push(val)
        } else {
            if stack.isEmpty { return false }
            let last = stack.pop()
            let open = opening(val)
            if last != open {
                return false
            }
            
        }
    }
    return stack.isEmpty
}

fileprivate func opening(_ str: String) -> String {
    if str == ")" {
        return "("
    } else if str == "}" {
        return "{"
    } else {
        return "["
    }
}
