//
//  DepthFirstSearch.swift
//  Algorithms In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation


fileprivate class Node {
    let name: String
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
    
    func depthFirstSearch(array: inout [String]) -> [String] {
        array.append(name)
        for child in children {
           _ =  child.depthFirstSearch(array: &array)
        }
        return array
    }
}
