//
//  InvertBinaryTree.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 19/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(logn)
 Note:
 */
fileprivate func invertBinaryTree(tree: BinaryTree?) {
    if let treeNode = tree {
        let temp = treeNode.left
        treeNode.left = treeNode.right
        treeNode.right = temp
        invertBinaryTree(tree: treeNode.left)
        invertBinaryTree(tree: treeNode.right)
    }
}

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note:
 */
fileprivate func invertBinaryTreeIterative(tree: BinaryTree?) {
    guard let node = tree else { return }
    var queue: [BinaryTree] = [node]
    while !queue.isEmpty {
        let treeNode = queue.removeFirst()
        let temp = treeNode.left
        treeNode.left = treeNode.right
        treeNode.right = temp
        if let leftNode = treeNode.left {
            queue.append(leftNode)
        }
        if let rightNode = treeNode.right {
            queue.append(rightNode)
        }
    }
}
