//
//  RemoveKthNodeFromEnd.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 30/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */
func removeKthNodeFromEnd(head: LinkedList, k: Int) {
    let positionToBeDeleted = getLength(from: head) - k
    var pos = 0
    var previous: LinkedList? = nil
    var currentNode: LinkedList? = head
    while pos != positionToBeDeleted {
        pos += 1
        previous = currentNode
        currentNode = currentNode?.next
    }
    if previous == nil {
        head.value = currentNode!.next!.value
        head.next = currentNode?.next?.next
        return
    }
    previous?.next = currentNode?.next
    
}

func getLength(from head: LinkedList) -> Int {
    var currentNode: LinkedList? = head
    var length = 0
    while currentNode != nil {
        length += 1
        currentNode = currentNode?.next
    }
    return length
}
