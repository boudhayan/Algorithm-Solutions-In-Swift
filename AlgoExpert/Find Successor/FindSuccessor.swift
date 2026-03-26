//
//  FindSuccessor.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/07/21.
//

import Foundation

/**
 Time Complexity: O(h)
 Space Complexity: O()
 Note:
 */
func findSuccessor(_ tree: BinaryTree, _ node: BinaryTree) -> BinaryTree? {
    if node.right != nil {
        return getLeftMostChild(node.right!)
    }
    return getRightMostParent(node)
}

func getLeftMostChild(_ node: BinaryTree) -> BinaryTree {
    var currentNode = node
    while currentNode.left != nil {
        currentNode = currentNode.left!
    }
    return currentNode
}

func getRightMostParent(_ node: BinaryTree) -> BinaryTree? {
    var currentNode = node
    while currentNode.parent != nil, currentNode.parent!.right === currentNode {
        currentNode = currentNode.parent!
    }
    return currentNode.parent
}
