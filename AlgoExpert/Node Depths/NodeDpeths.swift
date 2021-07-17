//
//  NodeDpeths.swift
//  Algorithms In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

fileprivate class BinaryTree {
    var value: Int
    var left: BinaryTree?
    var right: BinaryTree?
    
    init(value: Int) {
        self.value = value
    }
}

/**
 Time Complexity: O(n)
 Space Complexity: O(h)
 Note: where n is the number of node in the binary tree and h is the height of the binary tree
 */
fileprivate func nodeDepths(_ root: BinaryTree?) -> Int {
    return nodeDepthsHelper(node: root, depth: 0)
}

fileprivate func nodeDepthsHelper(node: BinaryTree?, depth: Int) -> Int {
    guard let tree = node else { return 0 }
    return depth + nodeDepthsHelper(node: tree.left, depth: depth + 1) + nodeDepthsHelper(node: tree.right, depth: depth + 1)
}
