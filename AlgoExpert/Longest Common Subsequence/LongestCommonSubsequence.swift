//
//  LongestCommonSubsequence.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 19/07/22.
//

import Foundation

func longestCommonSubsequence(firstString: String, secondString: String) -> [String] {
    guard !firstString.isEmpty, !secondString.isEmpty else { return [] }
    let firstChars = Array(firstString)
    let secondChars = Array(secondString)
    var subsequences = Array(repeating: Array(repeating: "", count: firstChars.count + 1), count: secondChars.count + 1)
    subsequences[0][0] = ""
    for col in 1..<subsequences[0].count - 1 {
        subsequences[0][col] = ""
    }
    for row in 1..<subsequences.count {
        subsequences[row][0] = ""
    }
    
    for row in 1..<subsequences.count {
        for col in 1..<subsequences[0].count {
            if firstChars[col - 1] == secondChars[row - 1] {
                subsequences[row][col] = subsequences[row - 1][col - 1] + String(firstChars[col - 1])
            } else {
                if subsequences[row - 1][col].count > subsequences[row][col - 1].count {
                    subsequences[row][col] = subsequences[row - 1][col]
                } else {
                    subsequences[row][col] = subsequences[row][col - 1]

                }
            }
        }
    }
    let result = subsequences[subsequences.count - 1][subsequences[0].count - 1]
    return result.map { "\($0)" }
}


// print(longestCommonSubsequence(firstString: "ZXVVYZW", secondString: "XKYKZPW"))
