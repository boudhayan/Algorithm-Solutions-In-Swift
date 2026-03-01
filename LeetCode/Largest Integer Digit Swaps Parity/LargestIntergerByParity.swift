//
//  LargestIntergerByParity.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 10/04/22.
//

import Foundation

/**
 Question Link: https://leetcode.com/contest/weekly-contest-288/problems/largest-number-after-digit-swaps-by-parity/
 Time Complexity: O(n^2)
 Space Complexity: O(n)
 Note: n is the length of the number
 */


func largestInteger(_ num: Int) -> Int {
    var digits = Array(String(num)).map { Int(String($0))! }
    for idx in stride(from: 0, through: digits.count - 1, by: 1){
        let value = digits[idx]
        if value == 8 || value == 9 {
            continue
        }
        var cdx = idx + 1
        var mdx = idx
        var maxValue = value + 1
        let isEven = value % 2 == 0
        while cdx < digits.count {
            if digits[cdx] >= maxValue, (digits[cdx] % 2 == 0) == isEven {
                maxValue = digits[cdx]
                mdx = cdx
            }
            cdx += 1
        }
       
        digits.swapAt(idx, mdx)
    }
    let result = digits.reduce(0) { r, d in
        return 10 * r + d
    }
    return result
}
