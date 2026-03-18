//
//  MinStack.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/02/24.
//

import Foundation

class MinStack {
    
    private var stack = [(Int, Int)]()
    
    init() {
        
    }
    
    func push(_ val: Int) {
        if stack.isEmpty {
            stack.append((val, val))
            return
        }
        stack.append(val < getMin() ? (val, val) : (val, getMin()))
    }
    
    func pop() {
        stack.removeLast()
    }
    
    func top() -> Int {
        return stack.last?.0 ?? -1
    }
    
    func getMin() -> Int {
        return stack.last?.1 ?? -1
    }
}
