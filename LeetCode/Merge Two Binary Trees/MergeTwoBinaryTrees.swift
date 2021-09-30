//
//  MergeTwoBinaryTrees.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 01/10/21.
//

import Foundation

// 617 -> https://leetcode.com/problems/merge-two-binary-trees/

fileprivate class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

fileprivate func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
    if root1 == nil, root2 == nil { return nil }
    let value = (root1?.val ?? 0) + (root2?.val ?? 0)
    let newNode = TreeNode(value)
    newNode.left = mergeTrees(root1?.left, root2?.left)
    newNode.right = mergeTrees(root1?.right, root2?.right)
    return newNode
}
