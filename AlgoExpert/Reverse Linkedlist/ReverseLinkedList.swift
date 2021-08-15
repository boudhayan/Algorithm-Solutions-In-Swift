//
//  ReverseLinkedList.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 15/08/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note: 
 */
func reverseLinkedList(_ linkedList: LinkedList) -> LinkedList {
    if linkedList == nil || linkedList.next == nil {
        return linkedList
    }
    let result = reverseLinkedList(linkedList.next!)
    linkedList.next?.next = linkedList
    linkedList.next = nil
    return result
}
