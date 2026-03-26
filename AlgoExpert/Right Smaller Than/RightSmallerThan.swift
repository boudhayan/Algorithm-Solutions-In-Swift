//
//  RightSmallerThan.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 04/07/22.
//

import Foundation

// T: O(nlogn), S: O(n)

func rightSmallerThan(_ array: [Int]) -> [Int] {
    if array.count == 0 { return [] }
    let bst = SpecialBST(value: array[array.count - 1], index: array.count - 1)
    for i in stride(from: array.count - 2, through: 0, by: -1) {
        bst.insert(value: array[i], index: i)
    }
    var rightSmallers = Array(repeating: 0, count: array.count)
    populateRightSmallers(tree: bst, array: &rightSmallers)

    return rightSmallers
}

func populateRightSmallers(tree: SpecialBST?, array: inout [Int]) {
    if let node = tree {
        array[node.index] = node.numSmallerAtInsertTime
        populateRightSmallers(tree: node.left, array: &array)
        populateRightSmallers(tree: node.right, array: &array)

    }
}
class SpecialBST {
    var value: Int
    var left: SpecialBST?
    var right: SpecialBST?
    var leftSubTreeCount = 0
    var index: Int
    var numSmallerAtInsertTime: Int
    
    init(value: Int, index: Int, numSmallerAtInsertTime: Int = 0) {
        self.value = value
        self.index = index
        self.numSmallerAtInsertTime = numSmallerAtInsertTime
    }
    
    func insert(value: Int, index: Int, numSmallerAtInsertTime: Int = 0) {
        if value < self.value {
            leftSubTreeCount += 1
            if let left = self.left {
                left.insert(value: value, index: index, numSmallerAtInsertTime: numSmallerAtInsertTime)
            } else {
                self.left = SpecialBST(value: value,  index: index, numSmallerAtInsertTime: numSmallerAtInsertTime)
                return
            }
        } else {
            var numSmaller = numSmallerAtInsertTime + leftSubTreeCount
            if value > self.value {
                numSmaller += 1
            }
            if let right = self.right {
                right.insert(value: value, index: index, numSmallerAtInsertTime: numSmaller)
            } else {
                self.right = SpecialBST(value : value, index: index, numSmallerAtInsertTime: numSmaller)
                return
            }
        }
    }
}
