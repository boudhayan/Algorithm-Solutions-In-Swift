//
//  DeleteNode.swift
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


fileprivate func deleteNode(_ node: ListNode?) {
    var tempNext = node?.next
    node?.val = tempNext?.val ?? -1
    node?.next = tempNext?.next
}
