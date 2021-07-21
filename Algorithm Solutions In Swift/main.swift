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

var array = [1, 5, 4, 3, 2, 6]
almostSorted(arr: array)
