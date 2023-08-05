//
//  BST2.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 05/08/23.
//

import Foundation

//https://leetcode.com/problems/unique-binary-search-trees-ii/

fileprivate class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

fileprivate func generateTrees(_ n: Int) -> [TreeNode?] {
         func generate(_ first: Int, _ last: Int) -> [TreeNode?] {
        guard first <= last else {
            return [nil]
        }
        var trees: [TreeNode?] = []
        for value in first...last {
            for left in generate(first, value-1) {
                for right in generate(value+1, last) {
                    trees.append(TreeNode(value: value, left: left, right: right))
                }
            }
        }
        return trees
    }
    return generate(1, n)
    }
