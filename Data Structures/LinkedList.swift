//
//  LinkedList.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/07/21.
//

import Foundation

class LinkedList {
    var value: Int
    var next: LinkedList?
    
    init(value: Int) {
        self.value = value
        self.next = nil
    }
}

extension LinkedList {
    func traverse() {
        var current: LinkedList? = self
        while current != nil {
            print("\(current!.value) >> ", terminator: "")
            current = current?.next
        }
        print("\n")
    }
    
    @discardableResult func adding(_ value: Int) -> LinkedList {
        var current: LinkedList? = self
        while current?.next != nil {
            current = current?.next
        }
        current?.next = LinkedList(value: value)
        return self
    }
}


