//
//  MaximumDepthBinaryTree.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/10/22.
//

import Foundation

func maxDepth(_ root: BinaryTree?) -> Int {
    var maxDepth = 0
    maxDepthHelper(root, current: 1, maxDepth: &maxDepth)
    return maxDepth
}

func maxDepthHelper(_ treeNode: BinaryTree?, current: Int, maxDepth: inout Int) {
    guard let node = treeNode else {
        return
    }
    maxDepth = max(maxDepth, current)
    if let left = node.left {
        maxDepthHelper(left, current: current + 1, maxDepth: &maxDepth)
    }
    if let right = node.right {
        maxDepthHelper(right, current: current + 1, maxDepth: &maxDepth)
    }
}
