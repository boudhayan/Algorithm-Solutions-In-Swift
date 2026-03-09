//
//  BranchSums.swift
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
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note: where n is the number of nodes in the binary tree
 */
fileprivate func branchSums(root: BST) -> [Int] {
    var sums = [Int]()
    branchSumsHelper(node: root, currentSum: 0, sums: &sums)
    return sums
}


fileprivate func branchSumsHelper(node: BST?, currentSum: Int, sums: inout [Int]) {
    if node?.left == nil, node?.right == nil {
        sums.append(currentSum + (node?.value ?? 0))
        return
    }
    let newCurrentSum = currentSum + (node?.value ?? 0)
    if node?.left != nil {
        branchSumsHelper(node: node?.left, currentSum: newCurrentSum, sums: &sums)
    }
    if node?.right != nil {
        branchSumsHelper(node: node?.right, currentSum: newCurrentSum, sums: &sums)
    }
}
