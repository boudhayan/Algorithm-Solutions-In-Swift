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
    func binaryTreeDiameter(_ tree: BinaryTree) -> Int {
        var maxDiameter = Int(Int32.min)
        _ = diameter(tree, maximumDiameter: &maxDiameter)
        return maxDiameter
    }

    func diameter(_ tree: BinaryTree?, maximumDiameter: inout Int) -> Int {
        if tree == nil {
            // for any node that is nil
            return -1
        }
        let leftTreeDiameter = 1 + diameter(tree?.left, maximumDiameter: &maximumDiameter)
        let rightTreeDiameter = 1 + diameter(tree?.right, maximumDiameter: &maximumDiameter)
        // current node's total diamter is total of left and right tree diameter
        let newTotalDiameter = leftTreeDiameter + rightTreeDiameter
        if newTotalDiameter > maximumDiameter {
            // update maximum diameter
            maximumDiameter = newTotalDiameter
        }
        // return either left or right tree diameter, as for diameter no node should be connected to more than two nodes
        return leftTreeDiameter > rightTreeDiameter ? leftTreeDiameter : rightTreeDiameter
    }

}
