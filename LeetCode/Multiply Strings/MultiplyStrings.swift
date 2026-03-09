//
//  MultiplyStrings.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 01/10/21.
//

import Foundation

fileprivate func multiply(_ num1: String, _ num2: String) -> String {
    let firstNumber = Array(num1)
    let secondNumber = Array(num2)
    var result = Array(repeating: 0, count: num1.count + num2.count)
    for i in stride(from: firstNumber.count - 1, through: 0, by: -1) {
        for j in stride(from: secondNumber.count - 1, through: 0, by: -1) {
            guard let firstDigit = firstNumber[i].wholeNumberValue, let secondDigit = secondNumber[j].wholeNumberValue else { return "" }
            let carryPos = i + j
            let resultPos = i + j + 1
            let val = (firstDigit * secondDigit) + result[resultPos]
            result[resultPos] = val % 10
            result[carryPos] += val / 10
        }
    }
    while let firstSumDigit = result.first, firstSumDigit == 0 {
        result.removeFirst()
    }
    let intResult = result.map { String($0) }.joined()
    return result.count > 0 ? intResult : "0"
}
