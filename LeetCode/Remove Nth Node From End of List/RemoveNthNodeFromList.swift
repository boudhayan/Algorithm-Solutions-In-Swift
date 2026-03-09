//
//  RemoveNthNodeFromList.swift
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

fileprivate func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var current: ListNode? = head
    var c = 1
    while c < n {
        current = current?.next
        c += 1
    }
    var nodeToDelete = head
    var prev: ListNode? = nil
    while let tempNext = current?.next {
        current = tempNext
        prev = nodeToDelete
        nodeToDelete = nodeToDelete?.next
    }
    // if nodeToDelete?.next == nil {
    //     return nil
    // }
    if nodeToDelete === head {
        return head?.next
    }
    
    prev?.next = nodeToDelete?.next
    return head
}
