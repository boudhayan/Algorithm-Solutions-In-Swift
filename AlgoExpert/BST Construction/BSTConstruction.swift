//
//  BSTConstruction.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/07/21.
//

import Foundation

extension BinarySearchTree {
    /**
     Time Complexity: O(logn)
     Space Complexity: O(1)
     Note:
     */
    func insert(value: Int) -> BinarySearchTree {
        var currentNode: BinarySearchTree? = self
        while let node = currentNode {
            if value < node.value {
                if node.left == nil {
                    node.left = BinarySearchTree(value: value)
                    break
                } else {
                    currentNode = node.left
                }
            } else {
                if node.right == nil {
                    node.right = BinarySearchTree(value: value)
                    break
                } else {
                    currentNode = node.right
                }
            }
        }
        return self
    }
    
    /**
     Time Complexity: O(logn)
     Space Complexity: O(1)
     Note:
     */
    func contains(value: Int) -> Bool {
        var currentNode: BinarySearchTree? = self
        while let node = currentNode {
            if value < node.value {
                currentNode = node.left
            } else if value > node.value {
                currentNode = node.right
            } else {
               return true
            }
        }
        return false
    }
    
    /**
     Time Complexity: O(logn)
     Space Complexity: O(1)
     Note:
     */
    func remove(value: Int, parentNode: BinarySearchTree?) -> BinarySearchTree {
        var currentNode: BinarySearchTree? = self
        var parent = parentNode
        while let node = currentNode {
            if value < node.value {
                parent = currentNode
                currentNode = node.left
            } else if value > node.value {
                parent = currentNode
                currentNode = node.right
            } else {
                //1. When the nodes to be deleted has both left and right child node
                //2. When the node to be deleted is the root node (parent node is nil) and it has either left branch or right branch
                //3. When the node to be deleted has parent node and node to be deleted is either the only left or right child of parent node
                if let _ = node.left, let rightNode = node.right {
                    node.value = rightNode.getMinimumValue()
                    let _ = rightNode.remove(value: node.value, parentNode: node)
                } else if parent == nil {
                    if let leftNode = node.left {
                        node.value = leftNode.value
                        node.right = leftNode.right
                        node.left = leftNode.left
                    } else if let rightNode = node.right {
                        node.value = rightNode.value
                        node.left = rightNode.left
                        node.right = rightNode.right
                    } else {
                        
                    }
                } else if let parent = parent, node === parent.left {
                    if let newLeft = node.left {
                        parent.left = newLeft
                    } else {
                        parent.left = node.right
                    }
                } else if let parent = parent, node === parent.right {
                    if let newLeft = node.left {
                        parent.right = newLeft
                    } else {
                        parent.right = node.right
                    }
                }
                break
            }
        }
        return self
    }
    
    func getMinimumValue() -> Int {
        var currentNode: BinarySearchTree = self
        while let node = currentNode.left {
            currentNode = node
        }
        return currentNode.value
    }
}
