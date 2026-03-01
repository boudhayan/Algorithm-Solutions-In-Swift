//
//  ValidateBST.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/07/21.
//

import Foundation

extension BinarySearchTree {
    /**
     Time Complexity: O(n)
     Space Complexity: O(d)
     Note: n is the number of node in the BST and d is the depth(height) of the BST
     */
    func validateBinarySearchTree(tree: BinarySearchTree) -> Bool {
        let minimumPossibleValue = Int(Int32.min)
        let maximumPossibleValue = Int(Int32.max)
        return checkIfBSTNodeValueInRange(for: tree, minimumPossibleValue: minimumPossibleValue, maximumPossibleValue: maximumPossibleValue)
    }
    
    func checkIfBSTNodeValueInRange(for node: BinarySearchTree?, minimumPossibleValue: Int, maximumPossibleValue: Int) -> Bool {
        guard let bstNode = node else { return true }
        if bstNode.value < minimumPossibleValue || bstNode.value >= maximumPossibleValue { return false }
        return checkIfBSTNodeValueInRange(for: bstNode.left, minimumPossibleValue: minimumPossibleValue, maximumPossibleValue: bstNode.value) && checkIfBSTNodeValueInRange(for: bstNode.right, minimumPossibleValue: bstNode.value, maximumPossibleValue: maximumPossibleValue)
    }
}
