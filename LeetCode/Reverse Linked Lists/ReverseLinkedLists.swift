//
//  ReverseLinkedLists.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/10/22.
//

import Foundation

fileprivate class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

fileprivate func reverseList(_ head: ListNode?) -> ListNode? {
    var node: ListNode? = head
    var previous: ListNode? = nil
    while let current = node {
        let next = current.next
        current.next = previous
        previous = current
        node = next
    }
    return previous
}
