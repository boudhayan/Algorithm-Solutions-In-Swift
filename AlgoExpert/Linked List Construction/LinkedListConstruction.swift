//
//  LinkedListConstruction.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/07/21.
//

import Foundation

class DoublyListNode {
    var value: Int
    var previous: DoublyListNode?
    var next: DoublyListNode?
    
    init(value: Int) {
        self.value = value
        self.previous = nil
        self.next = nil
    }
}


class DoublyLinkedList {
    var head: DoublyListNode?
    var tail: DoublyListNode?
    
    init() {
        self.head = nil
        self.tail = nil
    }
    
    /**
     Time Complexity: O(n)
     Space Complexity: O(1)
     Note:
     */
    func containsNodeWithValue(value: Int) -> Bool {
        var node = head
        while node !== nil, node?.value != value {
            node = node?.next
        }
        return node !== nil
    }
    
    func remove(node: DoublyListNode) {
        
    }
    
    func removeNodesWithValue(value: Int) {
       
    }
    
    func insertBefore(node: DoublyListNode, nodeToInsert: DoublyListNode) {
       
    }
    
    func insertAfter(node: DoublyListNode, nodeToInsert: DoublyListNode) {
    
    }
    
    /**
     Time Complexity: O(n)
     Space Complexity: O(1)
     Note:
     */
    func setHead(node: DoublyListNode) {
     
        
    }
    
    /**
     Time Complexity: O(n)
     Space Complexity: O(1)
     Note:
     */
    func setTail(node: DoublyListNode) {
     
    }
    
    func insertAtPosition(position: Int, nodeToInsert: DoublyListNode) {
        
    }
    
    func removeNodeBindings(node: DoublyListNode) {
      
    }
}
