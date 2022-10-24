//
//  MergeKLists.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 26/09/22.
//

import Foundation

fileprivate class ListNode {
    var val: Int
    var next: ListNode?
    
    init(val: Int, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

fileprivate func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists.isEmpty {
        return nil
    }
    if lists.count == 1 {
        return lists[0]
    }
    var node = lists[0]
    for i in 1..<lists.count {
       node =  mergeList(l1: node, l2: lists[i])
    }
    return node
}

fileprivate func mergeList(l1: ListNode?, l2: ListNode?) -> ListNode? {
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    if l1!.val < l2!.val {
        l1?.next = mergeList(l1: l1?.next, l2: l2)
    } else {
        l2?.next = mergeList(l1: l1, l2: l2?.next)
    }
    return l1!.val < l2!.val ? l1 : l2
}
