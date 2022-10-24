//
//  StringsMultiply.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/10/22.
//

import Foundation

fileprivate func multiply(_ num1: String, _ num2: String) -> String {
    if num1 == "0" || num2 == "0" {
        return "0"
    }
    let first = Array(num1.reversed())
    let second = Array(num2.reversed())
    var total = ""
    for i in 0..<second.count {
        let value = singleMultiply(String(first), String(second[i]), i)
        total = sum(total, value)
    }
    return String(total.reversed())
}

func singleMultiply(_ num: String, _ multiplier: String, _ place: Int) -> String {
    var result = ""
    var p = place
    while p > 0 {
        result += "0"
        p -= 1
    }
    var carry = 0
    var j = 0
    let arr = Array(num)
    while j < num.count {
        var val = (Int(String(arr[j]))! * Int(multiplier)!) + carry
        carry = val/10
        val = val%10
        result  += "\(val)"
        j += 1
    }
    if carry > 0 {
        result += "\(carry)"
    }
    return result
}

func sum(_ str1: String, _ str2: String) -> String {
    guard !str1.isEmpty else { return str2 }
    guard !str2.isEmpty else { return str1 }
    
    let num1 = Array(str1), num2 = Array(str2)
    var carry = 0
    var sum = ""
    for i in 0..<max(num1.count, num2.count) {
        var f = i > num1.count - 1 ? 0 : Int(String(num1[i]))!
        var s = i > num2.count - 1 ? 0 : Int(String(num2[i]))!
        var val = f + s + carry
        carry = val/10
        sum += "\(val%10)"
    }
    if carry > 0 {
        sum += "\(carry)"
    }
    return sum
}
