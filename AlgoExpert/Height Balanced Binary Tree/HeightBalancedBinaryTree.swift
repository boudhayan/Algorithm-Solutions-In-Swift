//
//  HeightBalancedBinaryTree.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 19/06/22.
//

import Foundation


func heightBalancedBinaryTree(_ tree: BinaryTree) -> Bool {
    var balanced = true
    _ = height(tree, balanced: &balanced)
    return balanced
}

func height(_ tree: BinaryTree?, balanced: inout Bool) -> Int {
    if tree == nil {
        return -1
    }
    let leftTreeHeight = 1 + height(tree?.left, balanced: &balanced)
    let rightTreeHeight = 1 + height(tree?.right, balanced: &balanced)
    if abs(leftTreeHeight - rightTreeHeight) > 1 {
        balanced = false
    }
    return leftTreeHeight > rightTreeHeight ? leftTreeHeight : rightTreeHeight
}
