//
//  MaxPathSum.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/06/22.
//

import Foundation

//class BinaryTree {
//    var value: Int
//    var left: BinaryTree?
//    var right: BinaryTree?
//
//    init(value: Int) {
//        self.value = value
//        left = nil
//        right = nil
//    }
//}

// T: O(n), S: O(logn)

func maxPathSum(tree: BinaryTree?) -> Int {
    var maxSum = Int(Int32.min)
    print( maxPathSumHelper(tree: tree, maxSum: &maxSum))
    return maxSum
}

func maxPathSumHelper(tree: BinaryTree?, maxSum: inout Int) -> Int {
    guard let node = tree else {
        return 0
    }
    let lpSum = max(maxPathSumHelper(tree: node.left, maxSum: &maxSum), 0)
    let rpSum =  max(maxPathSumHelper(tree: node.right, maxSum: &maxSum), 0)
    maxSum = max(maxSum, node.value + lpSum + rpSum)
    return node.value + max(lpSum, rpSum)
}

//let tree = BinaryTree(value: 1)
//tree.left = BinaryTree(value: 2)
//tree.left?.left = BinaryTree(value: 4)
//tree.left?.right = BinaryTree(value: 5)
//
//tree.right = BinaryTree(value: 3)
//
//print(maxPathSum(tree: tree))
