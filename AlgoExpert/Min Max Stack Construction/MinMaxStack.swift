//
//  MinMaxStack.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/06/22.
//

import Foundation

// O(1) time, O(1) space

class StackElement {
    var min: Int
    var max: Int
    var val: Int
    
    init(min: Int, max: Int, val: Int) {
        self.min = min
        self.max = max
        self.val = val
    }
}

class MinMaxStack {
    private var stack = [StackElement]()
    
    func peek() -> Int? {
        return stack.isEmpty ? nil : stack.last?.val
    }
    
    func pop() -> Int? {
        // Write your code here.
        return stack.isEmpty ? nil : stack.popLast()?.val
    }
    
    func push(number: Int) {
        if stack.isEmpty {
            stack.append(StackElement(min: number, max: number, val: number))
        } else {
            let last = stack.last!
            stack.append(StackElement(min: min(number, last.min), max: max(number, last.max), val: number))
        }
    }
    
    func getMin() -> Int? {
        guard !stack.isEmpty else { return nil }
        return stack.last!.min
    }
    
    func getMax() -> Int? {
        guard !stack.isEmpty else { return nil }
        return stack.last!.max
    }
}

//let stack = MinMaxStack()
//stack.push(number: 5)
//print(stack.getMin())
//print(stack.getMax())
//stack.push(number: 7)
//print(stack.getMin())
//print(stack.getMax())
