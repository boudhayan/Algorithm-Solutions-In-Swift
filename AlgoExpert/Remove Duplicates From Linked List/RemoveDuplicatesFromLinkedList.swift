//
//  RemoveDuplicatesFromLinkedList.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

fileprivate class LinkedList {
    var value: Int
    var next: LinkedList?
    
    init(value: Int) {
        self.value = value
    }
}

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: n is the length of the linked list
 */
fileprivate func removeDuplicatesFromLinkedList(_ linkedList: LinkedList) -> LinkedList {
    var node: LinkedList? = linkedList
    while node?.next != nil {
        while node?.value == node?.next?.value {
            node?.next = node?.next?.next
        }
        node = node?.next
    }
    return linkedList
}
