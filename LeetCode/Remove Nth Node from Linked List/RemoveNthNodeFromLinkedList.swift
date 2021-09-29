//
//  RemoveNthNodeFromLinkedList.swift
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


fileprivate func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var slow = head
    var fast = head
    var f = 0
    while f < n {
        fast = fast?.next
        f += 1
    }
    
    if fast == nil {
        if slow === head {
            return slow?.next
        }
        return nil
    }
    while fast != nil, fast?.next != nil {
        slow = slow?.next
        fast = fast?.next
    }
    
    slow?.next = slow?.next?.next
    return head
}
