//
//  SymmetricTree_recursive.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 26/10/22.
//

import Foundation

fileprivate func isSymmetric(_ root: BinaryTree?) -> Bool {
    return isMirror(root, root)
}

func isMirror(_ first: BinaryTree?, _ second: BinaryTree?) -> Bool {
    if first == nil, second == nil {
        return true
    }
    if first == nil || second == nil {
        return false
    }
    return (first!.value == second!.value) && isMirror(first?.right, second?.left) && isMirror(first?.left, second?.right)
}
