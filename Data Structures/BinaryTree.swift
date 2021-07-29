//
//  BinaryTree.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/07/21.
//

import Foundation

class BinaryTree {
    var value: Int
    var left: BinaryTree?
    var right: BinaryTree?
    var parent: BinaryTree?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
        self.parent = nil
    }
}
