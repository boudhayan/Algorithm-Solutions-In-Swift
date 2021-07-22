//
//  FindLoop.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/07/21.
//

import Foundation

typealias List = LinkedList<Int>

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note:
 */
func findLoop(head: List) -> List? {
    var slowPointer: List? = head.next
    var fastPointer: List? = head.next?.next
    
    while slowPointer !== fastPointer {
        slowPointer = slowPointer?.next
        fastPointer = fastPointer?.next?.next
    }
    
    var firstPointer: List? = head
    var secondPointer: List? = fastPointer
    
    while firstPointer !== secondPointer {
        firstPointer = firstPointer?.next
        secondPointer = secondPointer?.next
    }
    
    return firstPointer
}
