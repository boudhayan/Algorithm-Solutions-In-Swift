//
//  SymmetricTree_Iterative.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 26/10/22.
//

import Foundation

fileprivate func isSymmetric(_ root: BinaryTree?) -> Bool {
    var leftValues = [Int]()
    var rightValues = [Int]()
    leftTraversal(root, &leftValues)
    rightTraversal(root, &rightValues)
    return leftValues == rightValues
}

func leftTraversal(_ root: BinaryTree?, _ values: inout [Int]) {
    guard let node = root else {
        return
    }
    leftTraversal(node.left, &values)
    values.append(node.value)
    leftTraversal(node.right, &values)
}

func rightTraversal(_ root: BinaryTree?, _ values: inout [Int]) {
    guard let node = root else {
        return
    }
    rightTraversal(node.right, &values)
    values.append(node.value)
    rightTraversal(node.left, &values)
}
