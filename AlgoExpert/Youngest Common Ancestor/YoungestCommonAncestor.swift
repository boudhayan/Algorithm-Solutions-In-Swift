//
//  YoungestCommonAncestor.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 06/07/22.
//

import Foundation

class AncestralTree {
    var name = String()
    var ancestor: AncestralTree?
    
    init(name: String) {
        self.name = name
        ancestor = nil
    }
}

// T: O(d), S: O(d)
// Note: Space complexity is O(d) because of recursion to find the depth of descendants. We could acheive in O(1) if we use iteration to find depth
func getYoungestCommonAncestor(_ topAncestor: AncestralTree?, _ descendantOne: inout AncestralTree?, _ descendantTwo: inout AncestralTree?) -> AncestralTree {
    // Write your code here.
    var heightOne = findHeight(of: descendantOne, top: topAncestor)
    var heightTwo = findHeight(of: descendantTwo, top: topAncestor)
    let maxHeight = max(heightOne, heightTwo)
    if heightOne == maxHeight {
        while heightOne != heightTwo, descendantOne?.ancestor != nil {
            heightOne -= 1
            descendantOne = descendantOne?.ancestor
        }
    } else {
        while heightOne != heightTwo, descendantTwo?.ancestor != nil {
            heightTwo -= 1
            descendantTwo = descendantTwo?.ancestor
        }
    }
    while descendantOne !== descendantTwo {
        descendantOne =  descendantOne?.ancestor
        descendantTwo =  descendantTwo?.ancestor
    }
    return descendantOne!
}
 
func findHeight(of desendant: AncestralTree?, top: AncestralTree?) -> Int {
    if desendant === top {
        return 0
    }
    var height = 0
    if let newDesendant = desendant?.ancestor {
        height = 1 + findHeight(of: newDesendant, top: top)
    }
    return height
}
