//
//  SumOfLinkedList.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 30/07/21.
//

import Foundation

/**
 Time Complexity: O(max(n, m))
 Space Complexity: O(max(n, m))
 Note: where n and m are length of linkedlists accordingly.
 */
func sumOfLinkedLists(_ linkedListOne: LinkedList, _ linkedListTwo: LinkedList) -> LinkedList? {
    var resultList: LinkedList?
    var head: LinkedList?
    var listOne: LinkedList? = linkedListOne
    var listTwo: LinkedList? = linkedListTwo
    var carry = 0
    while let first = listOne, let second = listTwo {
        var sum = first.value + second.value + carry
        if sum > 9 {
            carry = 1
            sum = sum % 10
        } else {
            carry = 0
        }
        if resultList == nil {
            resultList = LinkedList(value: sum)
            head = resultList
        } else {
            resultList?.next = LinkedList(value: sum)
            resultList = resultList?.next
        }
        listOne = listOne?.next
        listTwo = listTwo?.next
    }
    
    while let first = listOne {
        var sum = first.value + carry
        if sum > 9 {
            carry = 1
            sum = sum % 10
        } else {
            carry = 0
        }
        resultList?.next = LinkedList(value: sum)
        resultList = resultList?.next
        listOne = listOne?.next
    }
    
    while let second = listTwo {
        var sum = second.value + carry
        if sum > 9 {
            carry = 1
            sum = sum % 10
        } else {
            carry = 0
        }
        resultList?.next = LinkedList(value: sum)
        resultList = resultList?.next
        listTwo = listTwo?.next
    }
    if carry > 0 {
        resultList?.next = LinkedList(value: carry)
    }
    return head
}
