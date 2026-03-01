//
//  FindLoop.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/07/21.
//

import Foundation


/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note:
 */
func findLoop(head: LinkedList) -> LinkedList? {
    var slowPointer: LinkedList? = head.next
    var fastPointer: LinkedList? = head.next?.next
    
    while slowPointer !== fastPointer {
        slowPointer = slowPointer?.next
        fastPointer = fastPointer?.next?.next
    }
    
    var firstPointer: LinkedList? = head
    var secondPointer: LinkedList? = fastPointer
    
    while firstPointer !== secondPointer {
        firstPointer = firstPointer?.next
        secondPointer = secondPointer?.next
    }
    
    return firstPointer
}
