//
//  ConvertToBinary.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 15/08/21.
//

import Foundation
// c(0)     => ""
// c(0)  + 1 => 1
// c(1)  + 1 => 11
// c(3)  + 1 => 111
// c(7)  + 0 ==> 1110
// c(14) + 1 => 11101
// c(29) + 0 => 111011
// c(58) + 0 => 1110110
// c(116) + 1 => 11101001
// c(233)

func convertIntoBinary(number: Int) -> Int {
    return Int(convertIntoBinaryHelper(number: number))!
}

func convertIntoBinaryHelper(number: Int) -> String {
    if number == 0 {
        return ""
    }
    let divisionByTwo = number / 2
    let remainder = number % 2
    return String(remainder) + convertIntoBinaryHelper(number: divisionByTwo)
}
