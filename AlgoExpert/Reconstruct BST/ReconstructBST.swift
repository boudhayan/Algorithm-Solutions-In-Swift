//
//  ReconstructBST.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/06/22.
//

import Foundation

fileprivate class BST {
    var value: Int
    var left: BST?
    var right: BST?
    
    init(value: Int) {
        self.value = value
        left = nil
        right = nil
    }
    
    func insert(_ value: Int) -> Self {
        var current: BST? = self
        while let node = current {
            if value < node.value {
                if node.left == nil {
                    node.left = BST(value: value)
                    break
                } else {
                    current = node.left
                }
            } else {
                if node.right == nil {
                    node.right = BST(value: value)
                    break
                } else {
                    current = node.right
                }
            }
        }
        return self
    }
}

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note: 
 */
fileprivate func reconstructBst(_ preOrderTraversalValues: [Int]) -> BST {
    var nodeIdx = 0
    return reconstructBSTHelper(idx: &nodeIdx, minValue: Int(Int32.min), maxValue: Int(Int32.max), values: preOrderTraversalValues)!
}

fileprivate func reconstructBSTHelper(idx: inout Int, minValue: Int, maxValue: Int, values: [Int]) -> BST? {
    if idx >= values.count || values[idx] < minValue || values[idx] >= maxValue {
        return nil
    }
    let tree = BST(value: values[idx])
    idx += 1
    tree.left = reconstructBSTHelper(idx: &idx, minValue: minValue, maxValue: tree.value, values: values)
    tree.right = reconstructBSTHelper(idx: &idx, minValue: tree.value, maxValue: maxValue, values: values)
    return tree
}


