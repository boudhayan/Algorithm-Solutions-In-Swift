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
    
    /**
     Time Complexity: O(1)
     Space Complexity: O(1)
     Note:
     */
    func remove(node: DoublyListNode) {
        if node === head {
            head = head?.next
        }
        
        if node === tail {
            tail = tail?.previous
        }
        
        removeNodeBindings(node: node)
    }
    
    /**
     Time Complexity: O(N)
     Space Complexity: O(1)
     Note:
     */
    func removeNodesWithValue(value: Int) {
       var node = head
        while node != nil, let nodeToRemove = node {
            node = node?.next
            if nodeToRemove.value == value {
                remove(node: nodeToRemove)
            }
        }
    }
    
    /**
     Time Complexity: O(1)
     Space Complexity: O(1)
     Note:
     */
    func insertBefore(node: DoublyListNode, nodeToInsert: DoublyListNode) {
        if nodeToInsert === head, nodeToInsert === tail {
            return
        }
        remove(node: nodeToInsert)
        nodeToInsert.previous = node.previous
        nodeToInsert.next = node
        if node.previous == nil {
            head = nodeToInsert
        } else {
            node.previous?.next = nodeToInsert
        }
        node.previous = nodeToInsert
    }
    /**
     Time Complexity: O(1)
     Space Complexity: O(1)
     Note:
     */
    func insertAfter(node: DoublyListNode, nodeToInsert: DoublyListNode) {
        if nodeToInsert === head, nodeToInsert === tail {
            return
        }
        remove(node: nodeToInsert)
        nodeToInsert.previous = node
        nodeToInsert.next = node.next
        if node.next == nil {
            tail = nodeToInsert
        } else {
            node.next?.previous = nodeToInsert
        }
        node.next = nodeToInsert
    }
    
    /**
     Time Complexity: O(1)
     Space Complexity: O(1)
     Note:
     */
    func setHead(node: DoublyListNode) {
        if head == nil {
            self.head = node
            self.tail = node
            return
        }
        self.insertBefore(node: head!, nodeToInsert: node)
    }
    
    /**
     Time Complexity: O(1)
     Space Complexity: O(1)
     Note:
     */
    func setTail(node: DoublyListNode) {
        if tail == nil {
            setHead(node: node)
            return
        }
        insertAfter(node: tail!, nodeToInsert: node)
    }
    
    /**
     Time Complexity: O(p)
     Space Complexity: O(1)
     Note: where p in the position
     */
    func insertAtPosition(position: Int, nodeToInsert: DoublyListNode) {
        if position == 1 {
            setHead(node: nodeToInsert)
            return
        }
        var node = head
        var currentPosition = 1
        while node != nil, currentPosition != position {
            node = node?.next
            currentPosition += 1
        }
        if node !== nil {
            insertBefore(node: node!, nodeToInsert: nodeToInsert)
        } else {
            setTail(node: nodeToInsert)
        }
    }
    
    func removeNodeBindings(node: DoublyListNode) {
        if let previous = node.previous {
            previous.next = node.next
        }
        if let next = node.next {
            next.previous = node.previous
        }
        node.previous = nil
        node.next = nil
    }
}
