//
//  FindNodesDistanceK.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 23/06/22.
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

// Step 1: Create a dictionary with every node's value as key and it's parent node as value
// Step 2: Find the target node with the given value, we have dictonary containing node value as key and parent node as value. get the parent node of the target value, either left or right child will be the target node
// Step 3: Use Queue staring with the target node, check if current queue element matches with K, otherwise check if parent, left ot right child exists of the current node and add them to the queue where the distace will be current distance + 1, use a seen set to insert the value that we have already checked just to not create an infinite loop or we do not want to visit same node again and again.

// T: O(n), S: O(n)


func findNodesDistanceK(_ tree: BinaryTree, _ target: Int, _ k: Int) -> [Int] {
    var dict = [Int: BinaryTree?]()
    findParentNodes(tree, parent: nil, dict: &dict)
    let targetNode = getNodeWithValue(target, tree: tree, dict: dict)
    print(dict)
    return findKDistanceNodes(targetNode, dict: dict, distance: k)
}

struct Element {
    var distance: Int
    var node: BinaryTree
}

func findKDistanceNodes(_ node: BinaryTree, dict: [Int: BinaryTree?], distance: Int) -> [Int] {
    var seen = Set<Int>()
    var queue: [Element] = [Element(distance: 0, node: node)]
    var results = [Int]()
    while !queue.isEmpty {
        let element = queue.remove(at: 0)
        if !seen.contains(element.node.value), element.distance == distance {
            results.append(element.node.value)
        }
        seen.insert(element.node.value)
        if let left = element.node.left, !seen.contains(left.value) {
            queue.append(Element(distance: element.distance + 1, node: left))
        }
        if let right = element.node.right, !seen.contains(right.value) {
            queue.append(Element(distance: element.distance + 1, node: right))
        }
        if let parentNode = dict[element.node.value]!, !seen.contains(parentNode.value) {
            queue.append(Element(distance: element.distance + 1, node: parentNode))
        }
    }
    return results
}

func findParentNodes(_ tree: BinaryTree?, parent: BinaryTree?, dict: inout [Int: BinaryTree?]) {
    if tree == nil {
        return
    }
    if let left = tree?.left {
        findParentNodes(left, parent: tree, dict: &dict)
    }
    if let right = tree?.right {
        findParentNodes(right, parent: tree, dict: &dict)
    }
    dict[tree!.value] = parent
}

func getNodeWithValue(_ value: Int, tree: BinaryTree, dict: [Int: BinaryTree?]) -> BinaryTree {
    if value == tree.value {
        return tree
    }
    let nodeParent = dict[value]!
    if nodeParent!.left != nil, nodeParent!.left!.value == value {
        return nodeParent!.left!
    }
    return nodeParent!.right!
}

//let tree = BinaryTree(value: 1)
//tree.left = BinaryTree(value: 2)
//tree.right = BinaryTree(value: 3)
//tree.left?.left = BinaryTree(value: 4)
//tree.left?.right = BinaryTree(value: 5)
//tree.right?.right = BinaryTree(value: 6)
//tree.right?.right?.left = BinaryTree(value: 7)
//tree.right?.right?.right = BinaryTree(value: 8)
//print(findNodesDistanceK(tree, 3, 2))
