//
//  BinarySearchTrees.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 20/07/21.
//

import Foundation


class BSTNode {
    var value: Int
    var left: BSTNode?
    var right: BSTNode?
    
    init(value: Int) {
        self.value = value
    }
}


func getHeight(root: BSTNode?) -> Int {
    var height = -1
    getHeightHelper(root: root, currentHeight: 0, maxHeight: &height)
    return height
}

func getHeightHelper(root: BSTNode?, currentHeight: Int, maxHeight: inout Int) {
    if root?.left == nil, root?.right == nil {
        maxHeight = max(currentHeight, maxHeight)
        return
    }
    if let leftNode = root?.left {
        getHeightHelper(root: leftNode, currentHeight: currentHeight + 1, maxHeight: &maxHeight)
    }
    if let rightNode = root?.right {
        getHeightHelper(root: rightNode, currentHeight: currentHeight + 1, maxHeight: &maxHeight)
    }
}
