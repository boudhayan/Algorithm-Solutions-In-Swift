//
//  BinarySearchTree.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/07/21.
//

import Foundation
import CloudKit


class BinarySearchTree<Element: Comparable> {
    var value: Element
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    
    init(value: Element) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}


