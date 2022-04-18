//
//  LicenseKeyFormatting.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 19/04/22.
//

import Foundation

/**
 Question Link: https://leetcode.com/problems/license-key-formatting/
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note: 
 */

func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
    let str = s.replacingOccurrences(of: "-", with: "")
    if str.count <= 1 { return  str.uppercased() }
    let numbers = Array(str)
    var result = ""
    var j = -1
    for idx in stride(from: numbers.count - k, through: 0, by: -k) {
        j = idx - 1
        let firstIndx = idx < 0 ? 0 : idx
        let lastIdx = firstIndx + k - 1
        if firstIndx == numbers.count - k {
            result += String(numbers[firstIndx...lastIdx])
        } else {
            result = String(numbers[firstIndx...lastIdx]) + "-" + result
        }
    }
    if j >= 0 {
        result = String(numbers[0...j]) + "-" + result
    }
    return result.uppercased()
}
