//
//  main.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

var arrayOne = [2, 1, 2, 2, 2, 3, 4, 2]
var arrayTwo = [26, 134, 135, 15, 17]

var root = BSTNode(value: 3)
root.left = BSTNode(value: 2)
root.left?.left = BSTNode(value: 1)
root.right = BSTNode(value: 5)
root.right?.left = BSTNode(value: 4)
root.right?.right = BSTNode(value: 6)
root.right?.right?.right = BSTNode(value: 7)

var matrix1 = [
    [1,   2,  3, 4],
    [12, 13, 14, 5],
    [11, 16, 15, 6],
    [10,  9,  8, 7]
]

var matrix2 = [
    [1, 2],
    [6, 3],
    [5, 4]
]

var matrix3 = [
    [1],
    [2],
    [3],
    [4]
]


var bt = BinaryTree(value: 1)
bt.left = BinaryTree(value: 3)
bt.left?.left = BinaryTree(value: 7)
bt.left?.left?.left = BinaryTree(value: 8)
bt.left?.left?.left?.left = BinaryTree(value: 9)
bt.right = BinaryTree(value: 2)
bt.left?.right = BinaryTree(value: 4)
bt.left?.right?.right = BinaryTree(value: 5)
bt.left?.right?.right?.right = BinaryTree(value: 6)

//var bt = BinaryTree(value: 2)
//bt.left = BinaryTree(value: 1)
//bt.left?.left = BinaryTree(value: 3)
//bt.left?.left?.right = BinaryTree(value: 5)
//bt.left?.left?.right?.right = BinaryTree(value: 10)
print(bt.diameter(bt))
