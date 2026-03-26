//
//  IsUglyNumber.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func isUgly(_ n: Int) -> Bool {
    if n <= 0 { return false }
    var number = n
    let allowedFactors = [2, 3, 5]
    for factor in allowedFactors {
        while number % factor == 0 {
            number /= factor
        }
    }
    return number == 1
}


//print(isUgly(6))
