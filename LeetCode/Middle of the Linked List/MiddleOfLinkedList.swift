//
//  MiddleOfLinkedList.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/09/21.
//

import Foundation

fileprivate class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


fileprivate func middleNode(_ head: ListNode?) -> ListNode? {
    guard let node = head else { return head }
    var slow: ListNode? = node
    var fast: ListNode? = node
    while fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}
