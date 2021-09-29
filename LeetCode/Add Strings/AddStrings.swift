//
//  AddStrings.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/09/21.
//

import Foundation

func addStrings(_ num1: String, _ num2: String) -> String {
    var num1Array = Array(num1)
    var num2Array = Array(num2)
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
