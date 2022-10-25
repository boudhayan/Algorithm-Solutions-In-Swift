//
//  StringToInteger.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/10/22.
//

import Foundation

func myAtoi(_ s: String) -> Int {
    var num = 0
    var isStarted = false
    var sign = 1
    for char in s {
        if char == " " {
            if isStarted {
                break
            }
        } else if char == "+" || char == "-" {
            if isStarted {
                break
            }
            isStarted = true
            if char == "-"{
                sign = -1
            }
        } else if char >= "0" && char <= "9" {
            isStarted = true
            if let val = char.wholeNumberValue {
                num = num * 10 + val
            }
            if num > Int32.max {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }
        } else {
            break
        }
    }
    return sign * num
}
