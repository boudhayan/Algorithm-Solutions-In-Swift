//
//  NextGreaterElement.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/09/22.
//

import Foundation

class Stack {
     var array = [Int]()
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    func push(_ element: Int) {
        array.append(element)
    }
    
    func pop() -> Int {
        array.removeLast()
    }
    
    func top() -> Int {
        array[array.count - 1]
    }
}

func nextGreaterElement(_ array: [Int]) -> [Int] {
    var elements = Array(repeating: -1, count: array.count)
    let stack = Stack()
    for i in stride(from: 0, to: 2 * array.count, by: 1) {
        let idx = i % array.count
        let currentNum = array[idx]
        while !stack.isEmpty, currentNum > array[stack.top()] {
            let rIdx = stack.pop()
            elements[rIdx] = array[idx]
        }
        stack.push(idx)
    }
    return elements
}
