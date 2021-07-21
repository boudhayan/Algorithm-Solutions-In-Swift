//
//  MinHeightBST.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/07/21.
//

import Foundation

fileprivate class BST {
    var value: Int
    var left: BST?
    var right: BST?
    
    init(value: Int) {
        self.value = value
    }
    
    func insert(_ value: Int) {
        if value < self.value {
            if let leftNode = self.left {
                leftNode.insert(value)
            } else {
                self.left = BST(value: value)
                return
            }
        } else {
            if let rightNode = self.right {
                rightNode.insert(value)
            } else {
                self.right = BST(value: value)
                return
            }
        }
    }
}

/**
 Time Complexity: O(N)
 Space Complexity: O(N)
 Note: 
 */
fileprivate func minHeightBST(_ array: [Int]) -> BST? {
    return constructBST(array: array, start: 0, end: array.count)
}

fileprivate func constructBST(array: [Int], start: Int, end: Int) -> BST? {
    if start > end {
        return nil
    }
    let mid = start + (end - start) / 2
    let node = BST(value: array[mid])
    node.left = constructBST(array: array, start: start, end: mid - 1)
    node.right = constructBST(array: array, start: mid + 1, end: end)
    return node
}
