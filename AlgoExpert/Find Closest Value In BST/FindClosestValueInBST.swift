//
//  FindClosestValueInBST.swift
//  Algorithms In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
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
 Time Complexity: O(logn)
 Space Complexity: O(logn)
 Note:
 */

fileprivate func findClosestValueInBST(tree: BST?, target: Int) -> Int {
    return findClosestValueInBSTHelper(tree: tree, target: target, closest: tree?.value ?? -1)
}

fileprivate func findClosestValueInBSTHelper(tree: BST?, target: Int, closest: Int) -> Int {
    guard let node = tree else { return closest }
    if node.value == target { return node.value }
    var currentClosest = closest
    if abs(target - node.value) < abs(target - closest) {
        currentClosest = node.value
    }
    if target < node.value {
        return findClosestValueInBSTHelper(tree: node.left, target: target, closest: currentClosest)
    } else {
        return findClosestValueInBSTHelper(tree: node.right, target: target, closest: currentClosest)
    }
}
