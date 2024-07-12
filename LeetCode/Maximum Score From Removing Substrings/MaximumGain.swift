//
//  MaximumGain.swift
//  Algorithm Solutions In Swift Tests
//
//  Created by Boudhayan Biswas on 12/07/24.
//

import Foundation

func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
    var res = 0
    var s = Array(s)
    for (pattern, gain) in [("ab", x), ("ba", y)].sorted(by: { $0.1 > $1.1 }) {
        var stack = [Character]()
        for char in s {
            stack.append(char)
            if String(stack.suffix(2)) == pattern {
                res += gain
                stack.removeLast(2)
            }
        }
        s = stack
    }
    return res
}
