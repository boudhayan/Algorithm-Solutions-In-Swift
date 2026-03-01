//
//  PopulatingNextPointer.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 01/10/21.
//

import Foundation

//116 -> https://leetcode.com/problems/populating-next-right-pointers-in-each-node/

fileprivate class Node {
    var val: Int
    var left: Node?
    var right: Node?
    var next: Node?
    
    init(_ val: Int) {
        self.val = val
    }
}

fileprivate func connect(_ root: Node?) -> Node? {
    if root == nil{
        return nil
    }
    var queue = [Node?]()
    queue.append(root)
    
    while !queue.isEmpty {
        var lastNode : Node? = nil
        var nodeCount = queue.count
        
        while nodeCount > 0 {
            if let node = queue.removeFirst(){
                nodeCount -= 1
                
                if lastNode != nil{
                    lastNode!.next = node
                    lastNode = node
                }else{
                    lastNode = node
                }
                if let left = node.left{
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        
    }
    return root
}

