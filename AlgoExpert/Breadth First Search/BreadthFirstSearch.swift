//
//  BreadthFirstSearch.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 19/07/21.
//

import Foundation

fileprivate class Node {
    var name: String
    var children: [Node]
    
    init(name: String) {
        self.name = name
        self.children = []
    }
    
    func addChild(name: String) -> Node {
        let newChild = Node(name: name)
        self.children.append(newChild)
        return self
    }
    
    /**
     Time Complexity: O(v + e)
     Space Complexity: O(n)
     Note:
     */
    func breadthFirstSearch(array: inout [String]) -> [String] {
        var queue = [self]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            array.append(node.name)
            for child in node.children {
                queue.append(child)
            }
        }
        return array
    }
}
