//
//  BinaryTreeDiameter.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/07/21.
//

import Foundation

extension BinaryTree {
    class TreeInfo {
        var diameter: Int
        var height: Int
        
        init(_ diameter: Int, _ height: Int) {
            self.diameter = diameter
            self.height = height
        }
    }
    /**
     Time Complexity: O(n)
     Space Complexity: O(d)
     Note: d is the depth of the longest branch
     */
    func diameter(_ tree: BinaryTree) -> Int {
        return getTreeInfo(for: tree).diameter
    }
    
    func getTreeInfo(for tree: BinaryTree?) -> TreeInfo {
        guard let node = tree else {
            return TreeInfo(0, 0)
        }
        let leftTreeInfo = getTreeInfo(for: node.left)
        let rightTreeInfo = getTreeInfo(for: node.right)
        let longestPathThroughRoot = leftTreeInfo.height + rightTreeInfo.height
        let maximumDiameterSoFar = max(leftTreeInfo.diameter, rightTreeInfo.diameter)
        let currentDiameter = max(maximumDiameterSoFar, longestPathThroughRoot)
        let currentHeight = 1 + max(leftTreeInfo.height, rightTreeInfo.height)
        return TreeInfo(currentDiameter, currentHeight)
    }
   
}
