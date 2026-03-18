//
//  AddStrings.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/09/21.
//

import Foundation

/**
 Question Link: https://leetcode.com/problems/add-strings/
 Time Complexity: O(max(N1, N2))
 Space Complexity: O(max(N1, N2))
 Note: N1 => length of first string, N2 => length of second string. Maximum sum length will be (MAX(N1, N2) + 1)
 */

func addStringsOptimized(_ num1: String, _ num2: String) -> String {
    guard !num1.isEmpty, !num2.isEmpty else { return "0" }
    
    let numbers1 = Array(num1)
    let numbers2 = Array(num2)
    // stores the sum
    var sumArray = Array(repeating: "-1", count: max(num1.count, num2.count) + 1)
    var n1 = numbers1.count - 1
    var n2 = numbers2.count - 1
    var k = sumArray.count - 1
    var carry = 0
    // loop through the each of the number from both the strings
    while n1 >= 0 || n2 >= 0 {
        // if n1 or n2 is less than 0, it indicates the all of the numbers from that string has been used to generate the sum
        let fn = n1 >= 0 ? Int(String(numbers1[n1]))! : 0 // if index is less than 0, return 0 as it will not affect the current sum
        let sn = n2 >= 0 ? Int(String(numbers2[n2]))! : 0
        let sum = fn + sn + carry
        carry = sum / 10
        sumArray[k] = "\(sum % 10)"
        k -= 1
        n1 -= 1
        n2 -= 1
        
    }
    // if carry is greater than zero, it means that is extra carry. We have to store that in the sum array
    if carry > 0 {
        sumArray[k] = "\(carry)"
    }
    return sumArray.filter { $0 != "-1" }.joined()
}

func addStringsOld(_ num1: String, _ num2: String) -> String {
    let num1Array = Array(num1)
    let num2Array = Array(num2)
    var num1Integers: [Int] = num1Array.map { Int(String($0))! }
    var num2Integers: [Int] = num2Array.map { Int(String($0))! }
    
    let maxLength = max(num1.count, num2.count)
    var num1Remaining = maxLength - num1.count
    var num2Remaining = maxLength - num2.count
    while num1Remaining > 0 {
        num1Integers.insert(0, at: 0)
        num1Remaining -= 1
    }
    
    while num2Remaining > 0 {
        num2Integers.insert(0, at: 0)
        num2Remaining -= 1
    }
    
    var result = ""
    var carry = 0
    var idx = num1Integers.count - 1
    while idx >= 0 {
        let cs = num1Integers[idx] + num2Integers[idx] + carry
        if cs > 9 {
            carry = cs/10
            result += "\(cs%10)"
        } else {
            carry = 0
            result += "\(cs)"
        }
        idx -= 1
    }
    if carry > 0 {
        result += "\(carry)"
    }
    return String(result.reversed())
}
