//
//  HashMap.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 23/07/23.
//

import Foundation

class MyHashMap {
    
    class Node {
        var key: Int
        var value: Int
        var next: Node?
        
        init(key: Int, value: Int, next: Node? = nil) {
            self.key = key
            self.value = value
            self.next = next
        }
    }
    
    private var container: [Node?]
    private var keyRange: Int
    
    init() {
        self.keyRange = 2970
        self.container = [Node?](repeating: nil, count: self.keyRange)
    }
    
    private func hash(_ key: Int) -> Int {
        return key%keyRange
    }
    
    func put(_ key: Int, _ value: Int) {
        let idx = hash(key)
        guard container[idx] != nil else {
            container[idx] = Node(key: key, value: value)
            return
        }
        var current: Node? = container[idx]
        while let node = current {
            if node.key == key {
                node.value = value
                return
            }
            if node.next == nil {
                break
            }
            current = node.next
        }
        current?.next = Node(key: key, value: value)
    }
    
    func get(_ key: Int) -> Int {
        let idx = hash(key)
        guard container[idx] != nil else {
            return -1
        }
        var current: Node? = container[idx]
        while let node = current {
            if node.key == key {
                return node.value
            }
            current = node.next
        }
        return -1
    }
    
    func remove(_ key: Int) {
        let idx = hash(key)
        guard container[idx] != nil else {
            return
        }
        if let node = container[idx], node.key == key {
            container[idx] = node.next
            return
        }
        var previous: Node? = container[idx]
        var current: Node? = container[idx]?.next
        while let node = current {
            if node.key == key {
                previous?.next = node.next
                return
            }
            previous = current
            current = current?.next
        }
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
