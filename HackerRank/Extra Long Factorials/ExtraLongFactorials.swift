//
//  ExtraLongFactorials.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 19/07/21.
//

import Foundation


func extraLongFactorials(n: Int) -> Void {
    var factorialResult = "1"
    for multiplier in 1...n {
        factorialResult = multiply(factorialResult, by: multiplier)
    }
    print(factorialResult)
}

func multiply(_ string: String, by multiplier: Int) -> String {
    let temp = Array(string).map { Int(String($0))! * multiplier }
    var result = ""
        var remainer = 0

        for number in temp.reversed(){
            let total = number + remainer
            remainer = total / 10
            result.insert(Character(String(total % 10)), at: result.startIndex)
        }
        while remainer > 0 {
            result.insert(Character(String(remainer % 10)), at: result.startIndex)
            remainer /= 10
        }

        return result
}
