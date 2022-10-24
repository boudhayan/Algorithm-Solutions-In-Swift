//
//  ReverseLinkedLists.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/10/22.
//

import Foundation

func reverseList(_ head: ListNode?) -> ListNode? {
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
