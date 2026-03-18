//
//  DivideTwoIntegers.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 23/09/21.
//

import Foundation

func divide(_ dividend: Int, by divisor: Int) -> Int {
    if dividend == 0 { return 0 }
    let isPositive = (dividend < 0 && divisor < 0) || (dividend >= 0 && divisor >= 0)
    let quotient = helper(abs(dividend), by: abs(divisor))
    return isPositive ? min(Int(Int32.max), quotient) : max(Int(Int32.min), -quotient)
}

func helper(_ dividend: Int, by divisor: Int) -> Int {
    guard dividend >= divisor else { return 0 }
    var multiple = 1
    var sum = divisor
    while sum + sum <= dividend {
        multiple += multiple
        sum += sum
    }
    return multiple + helper(dividend - sum, by: divisor)
}
