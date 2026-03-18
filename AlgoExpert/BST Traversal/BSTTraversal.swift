//
//  BSTTraversal.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 19/07/21.
//

import Foundation

fileprivate class BST {
    var value: Int
    var left: BST?
    var right: BST?
    
    init(value: Int) {
        self.value = value
    }
}
/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note:
 */
fileprivate func inOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
    if let node = tree {
        _ = inOrderTraversal(tree: node.left, array: &array)
        array.append(node.value)
        _ = inOrderTraversal(tree: node.right, array: &array)
    }
    return array
}

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note:
 */
fileprivate func preOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
    if let node = tree {
        array.append(node.value)
        _ = preOrderTraversal(tree: node.left, array: &array)
        _ = preOrderTraversal(tree: node.right, array: &array)
    }
    return array
}

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note:
 */
fileprivate func postOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
    if let node = tree {
        _ = postOrderTraversal(tree: node.left, array: &array)
        _ = postOrderTraversal(tree: node.right, array: &array)
        array.append(node.value)
    }
    return array
}
