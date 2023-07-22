//
//  HashSet.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 23/07/23.
//

import Foundation

class Node {
    var next: Node?
    var key: Int
    init(key: Int) {
        self.key = key
    }
}
class MyHashSet {

    var array: [Node?] = Array(repeating: nil, count: 10000)

    func hash(key: Int) -> Int {
        key % array.count
    }
    
    func add(_ key: Int) {
        let hash = hash(key: key)
        guard let root = array[hash] else {
            array[hash] = Node(key: key); return
        }
        var cur: Node? = root
        while cur != nil {
            if cur!.key == key {return}
            if cur!.next == nil {break}
            cur = cur!.next
        }
        cur!.next = Node(key: key)
    }
    
    func remove(_ key: Int) {
         let hash = hash(key: key)
        guard let root = array[hash] else { return }
        if root.key == key {
            array[hash] = root.next
        }
        var cur: Node? = root
        while cur!.next != nil {
            if cur!.next!.key == key {
                cur!.next = cur!.next!.next; return
            }
            cur = cur!.next
        }
    }
    
    func contains(_ key: Int) -> Bool {
          let hash = hash(key: key)
        guard let root = array[hash] else { return false}
        var cur: Node? = root
        while cur != nil {
            if cur!.key == key {return true}
            cur = cur!.next
        }
        return false
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
