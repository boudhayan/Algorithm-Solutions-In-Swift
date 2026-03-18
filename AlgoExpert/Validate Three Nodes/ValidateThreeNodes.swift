//
//  ValidateThreeNodes.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/06/22.
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
 Time Complexity: O(h)
 Space Complexity: O(h)
 Note:
 */
fileprivate func validateThreeNodes(_ nodeOne: BST, _ nodeTwo: BST, _ nodeThree: BST) -> Bool {
    if (isDesendent(nodeOne, of: nodeTwo) && isAncestor(nodeThree, of: nodeTwo)) || (isDesendent(nodeThree, of: nodeTwo) && isAncestor(nodeOne, of: nodeTwo)) {
        return true
    }
    return false
}

fileprivate func isDesendent(_ nodeA: BST, of nodeB: BST) -> Bool {
    var current: BST? = nodeB
    while let node = current {
        if nodeA.value < node.value {
            current = node.left
        } else {
            if nodeA === node {
                return true
            } else {
                current = node.right
            }
        }
    }
    return false
}


fileprivate func isAncestor(_ nodeA: BST, of nodeB: BST) -> Bool {
    var current: BST? = nodeA
    while let node = current {
        if nodeB.value < node.value {
            current = node.left
        } else {
            if nodeB === node {
                return true
            } else {
                current = node.right
            }
        }
    }
    return false
}
