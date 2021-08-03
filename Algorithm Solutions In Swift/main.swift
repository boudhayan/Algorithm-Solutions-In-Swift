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
bt.left = BinaryTree(value: 2)
bt.left?.left = BinaryTree(value: 4)
bt.left?.right = BinaryTree(value: 5)
bt.left?.left?.left = BinaryTree(value: 6)
bt.right = BinaryTree(value: 3)

var intervals = [[1, 22], [-20, 30]]

var llist1 = LinkedList(value: 2)
llist1.adding(4).adding(7).adding(1)
llist1.traverse()

var llist2 = LinkedList(value: 9)
llist2.adding(4).adding(5)
llist2.traverse()

var list = sumOfLinkedLists(llist1, llist2)
list!.traverse()

print(fourNumberSum(array: [7, 6, 4, -1, 1, 2], targetSum: 16))
