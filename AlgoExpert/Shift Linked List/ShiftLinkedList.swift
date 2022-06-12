//
//  ShiftLinkedList.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 12/06/22.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */
func shiftLinkedList(_ head: LinkedList, _ k: Int) -> LinkedList? {
    var length = 0
    var current: LinkedList? = head
    var tailNode: LinkedList? = nil
    while current != nil {
        tailNode = current
        current = current?.next
        length += 1
    }
    let offset = abs(k) % length
    if offset == 0 {
        return head
    }
    var finalTailPosition = length - offset
    if k <= 0 {
        finalTailPosition = offset
    }
    current = head
    var pos = 1
    while pos < finalTailPosition {
        current = current?.next
        pos += 1
    }
    let newHead = current?.next
    current?.next = nil
    tailNode?.next = head
    return newHead
}
