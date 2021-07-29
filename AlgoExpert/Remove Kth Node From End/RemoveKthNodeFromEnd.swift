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

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */
func removeKthNodeFromEndTwoPointer(head: LinkedList, k: Int) {
    var firstPointer: LinkedList? = head
    var secondPointer: LinkedList? = head
    var counter = 1
    while counter <= k {
        counter += 1
        secondPointer = secondPointer?.next
    }
    
    if secondPointer == nil {
        // node to be deleted is the head
        // change the value of the head and next pointer
        head.value = firstPointer!.next!.value
        head.next = firstPointer?.next?.next
        return
    }
    
    // visit till (k - 1)th node, so that first pointer points to the previous node of node to be deleted
    while secondPointer?.next != nil {
        firstPointer = firstPointer?.next
        secondPointer = secondPointer?.next
    }
    firstPointer?.next = firstPointer?.next?.next
}
