//
//  KthLargestNodeBST.swift
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
}

/**
 Time Complexity: O(k)
 Space Complexity: O(k)
 Note:
 */
fileprivate func findKthLargestValueInBst(_ tree: BST, _ k: Int) -> Int {
    var values = [Int]()
    visitBST(tree, values: &values)
    return values[k - 1]
}

fileprivate func visitBST(_ tree: BST, values: inout [Int]) {
    if let right = tree.right {
        visitBST(right, values: &values)
    }
    values.append(tree.value)
    if let left = tree.left {
        visitBST(left, values: &values)
    }
}
