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
        // if node to be removed is head, set the next node of head as head
        if node === head {
            head = head?.next
        }
        // if node to be removed is tail, set the previous node of tail as tail
        if node === tail {
            tail = tail?.previous
        }
        // remove the current bindings of the node
        removeNodeBindings(node: node)
    }
    
    /**
     Time Complexity: O(N)
     Space Complexity: O(1)
     Note:
     */
    // Removes all the nodes with value
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
        // if there is currently only one node in the list, then we can not move that further, so return
        if nodeToInsert === head, nodeToInsert === tail {
            return
        }
        // remove the node from the exisiting linked list
        remove(node: nodeToInsert)
        // we have set total four connection, 2 connection from node, 2 connection from nodeToInsert
        nodeToInsert.previous = node.previous
        nodeToInsert.next = node
        // when we are inserting before, we may end up in a situation whwere if node,previous is nil, we have to make nodeToInsert as new head
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
        // if there is currently only one node in the list, then we can not move that further, so return
        if nodeToInsert === head, nodeToInsert === tail {
            return
        }
        // remove the node from the exisiting linked list
        remove(node: nodeToInsert)
        // we have set total four connection, 2 connection from node, 2 connection from nodeToInsert
        nodeToInsert.previous = node
        nodeToInsert.next = node.next
        // when we are inserting next, we may end up in a situation whwere if node,next is nil, we have to make nodeToInsert as new tail

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
        // if the list was initially empty and this is the first node to be inserted (when head is nil)
        if head == nil {
            self.head = node
            self.tail = node
            return
        }
        // for any other node to be head, we have to insert that node before head node
        self.insertBefore(node: head!, nodeToInsert: node)
    }
    
    /**
     Time Complexity: O(1)
     Space Complexity: O(1)
     Note:
     */
    func setTail(node: DoublyListNode) {
        // if the list was initially empty and this is the first node to be inserted (when tail is nik, it means head will also be nik)
        if tail == nil {
            setHead(node: node)
            return
        }
        // for any other node to be tail, we have to insert that aftet tail
        insertAfter(node: tail!, nodeToInsert: node)
    }
    
    /**
     Time Complexity: O(p)
     Space Complexity: O(1)
     Note: where p in the position
     */
    func insertAtPosition(position: Int, nodeToInsert: DoublyListNode) {
        // if positioon is 1, setHead and return
        if position == 1 {
            setHead(node: nodeToInsert)
            return
        }
        // find the node
        var node = head
        var currentPosition = 1
        while node != nil, currentPosition != position {
            node = node?.next
            currentPosition += 1
        }
        // if node is not nil, then it means the position is valid and it exists (position < list length).
        // if node is nil, for any value which is greater than list length. node will be nil and nodeToInsert ell be set as tail node
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
