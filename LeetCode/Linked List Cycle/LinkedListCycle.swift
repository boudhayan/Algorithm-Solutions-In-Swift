//
//  LinkedListCycle.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/10/22.
//

import Foundation

fileprivate class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

fileprivate func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = head
    while fast?.next != nil, fast?.next?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            break
        }
    }
    if fast?.next == nil || fast?.next?.next == nil {
        return false
    }
    
    var first = head
    var second = slow
    var pos = 0
    while first !== second {
        first = first?.next
        second = second?.next
        pos += 1
    }
    return true
}
