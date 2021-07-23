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

var array = [2, 1]
print(mergeSort(&array))

