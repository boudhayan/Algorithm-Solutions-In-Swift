//
//  PalindromeLinkedList.swift
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
   var res = true
   var node = head
   recursiveVisit(head, &node, &res)
   return res
}

fileprivate func recursiveVisit(_ head: ListNode?, _ first: inout ListNode?, _ result: inout Bool)  {
   if head == nil {
       return
   }
   recursiveVisit(head?.next, &first, &result)
   if let last = head, let front = first {
       if last.val != front.val {
           result = false
       }
       first = front.next
   }
   
}
