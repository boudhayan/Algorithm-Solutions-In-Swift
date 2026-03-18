//
//  PalindromLinkedList_ConstantSpace.swift
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

fileprivate func isPalindrome(_ head: ListNode?) -> Bool {
    // find mid
    var middle = middleNode(head)
    
    // reverse from mid's next
    var back = reverseList(middle?.next)
    
    
    // prev is starting of mid reverse
    var forward = head
    var backward = back
    var result = true
    while forward != nil, backward != nil {
        if forward!.val != backward!.val {
            result = false
            break
        }
        forward = forward?.next
        backward = backward?.next
    }
    
    // repair the list
    middle?.next = reverseList(back)
    return result
}

fileprivate func reverseList(_ head: ListNode?) -> ListNode? {
    var current = head
    var prev: ListNode? = nil
    while let node = current {
        current = node.next
        node.next = prev
        prev = node
    }
    return prev
}

fileprivate func middleNode(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head
    while fast?.next != nil, fast?.next?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}
