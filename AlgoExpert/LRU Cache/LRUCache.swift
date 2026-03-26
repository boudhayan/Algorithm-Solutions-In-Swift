//
//  LRUCache.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 13/06/22.
//

import Foundation
import Darwin
class LRUCache {
    var maxSize: Int
    private var hashTable: [String: LRUDoublyLinkedListNode] = [:]
    private var linkedlist: LRUDoublyLinkedList
    private var currentSize = 0
    
    init(maxSize: Int) {
        self.maxSize = maxSize
        self.linkedlist = LRUDoublyLinkedList()
    }
    
    func insertKeyValuePair(_ key: String, _ value: Int) {
        // whatever key value is inserted from this method, will change the head of the linkedlist
        if hasKey(key) {
            // update the existing key's value
            hashTable[key]?.value = value
        } else {
            let newHead = LRUDoublyLinkedListNode(key: key, value: value)
            if currentSize == maxSize {
                hashTable[(linkedlist.tail?.key)!] = nil
                linkedlist.removeTail()
            } else {
                currentSize += 1
            }
            hashTable[key] = newHead
        }
        linkedlist.setHead(to: hashTable[key]!)
    }
    
    func getValueFromKey(_ key: String) -> Int? {
        guard hasKey(key) else {
            return nil
        }
        // return key's value and make that node head node of the linkedlist
        linkedlist.setHead(to: hashTable[key]!)
        return hashTable[key]?.value
    }
    
    func getMostRecentKey() -> String? {
        return currentSize > 0 ? linkedlist.head?.key : nil
    }
    
    private func hasKey(_ key: String) -> Bool {
        return hashTable.keys.contains(key)
    }
    
}

class LRUDoublyLinkedListNode {
    var key: String
    var value: Int
    var next: LRUDoublyLinkedListNode?
    var previous: LRUDoublyLinkedListNode?
    
    init(key: String, value: Int) {
        self.key = key
        self.value = value
        self.previous = nil
        self.next = nil
    }
}

class LRUDoublyLinkedList {
    var head: LRUDoublyLinkedListNode?
    var tail: LRUDoublyLinkedListNode?
    
    init() {
        self.head = nil
        self.tail = nil
    }
    
    func setHead(to newHead: LRUDoublyLinkedListNode) {
        if head === newHead {
            return
        } else if head == nil {
            // when cache was initially empty
            head = newHead
            tail = newHead
        } else if head === tail {
            // when max size is 1 or it had only one key-value pair
            tail?.previous = newHead
            newHead.next = tail
            head = newHead
        } else {
            // when this node was the least used node, means it was there at the end of the list. but now it will be new head
            if newHead === tail {
                removeTail()
            }
            // remove any existing bindings
            removeBindings(newHead)
            head?.previous = newHead
            newHead.next = head
            head = newHead
        }
    }
    
    func removeTail() {
        // when LRU cache is empty
        if tail == nil { return }
        
        // when maxSize of LRU cache is 1
        if head === tail {
            head = nil
            tail = nil
            return
        }
        
        // set the current tail's previous node as tail node
        tail = tail?.previous
        tail?.next = nil
    }
    
    func removeBindings(_ node: LRUDoublyLinkedListNode) {
        // if previous node is present, update previous node's next pointer
        if let previous = node.previous {
            previous.next = node.next
        }
        
        //if next node is present, update next node's previous pointer
        if let next = node.next {
            next.previous = node.previous
        }
        
        // set the bindings of node as nil
        node.previous = nil
        node.next = nil
    }
}

//let cache = LRUCache(maxSize: 3)
//cache.insertKeyValuePair("b", 2)
//cache.insertKeyValuePair("a", 1)
//cache.insertKeyValuePair("c", 3)
//print(cache.getMostRecentKey() as Any)
//print(cache.getValueFromKey("a") as Any)
//print(cache.getMostRecentKey() as Any)
//cache.insertKeyValuePair("d", 4)
//print(cache.getValueFromKey("b") as Any)
