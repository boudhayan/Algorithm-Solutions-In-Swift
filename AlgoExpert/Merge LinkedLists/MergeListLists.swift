//
//  MergeListLists.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 16/08/21.
//

import Foundation

/**
 Time Complexity: O(m + n)
 Space Complexity: O(m + n)
 Note: m is length of the first list and n is the length of the second list
 */
func mergeLinkedLists(_ headOne: LinkedList?, _ headTwo: LinkedList?) -> LinkedList {
    // Write your code here.
        guard let firstHead = headOne else {
        return headTwo!
    }
    
    guard let secondHead = headTwo else {
        return headOne!
    }
    
    if firstHead.value < secondHead.value {
        firstHead.next = mergeLinkedLists(firstHead.next, secondHead)
        return firstHead
    } else {
        secondHead.next = mergeLinkedLists(firstHead, secondHead.next)
        return secondHead
    }
  }
