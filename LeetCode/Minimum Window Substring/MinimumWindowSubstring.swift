//
//  MinimumWindowSubstring.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 04/02/24.
//

import Foundation

func minWindow(_ s: String, _ t: String) -> String {
    guard s.count >= t.count else { return "" }
    var sChars = Array(s)
    let freq = Dictionary(Array(t).map { ($0, 1)}, uniquingKeysWith: +)
    var l = 0
    var start = 0
    var seen = [Character: Int]()
    var matchedCount = 0
    var minWindowLength = Int(Int32.max)
    
    // expand the window to match characters
    for r in 0..<sChars.count {
        var current = sChars[r]
        if let freqCount = freq[current] {
            seen[current, default: 0] += 1
            if seen[current] == freqCount {
                matchedCount += 1
            }
        }
        
        while matchedCount == freq.count {
            if (r - l + 1) < minWindowLength {
                minWindowLength = r - l + 1
                start = l
            }
            
            let leftChar = sChars[l]
            l += 1
            
            if let freqCount = freq[leftChar] {
                if seen[leftChar] == freqCount {
                    matchedCount -= 1
                }
                seen[leftChar, default: 0] -= 1
            }
        }
    }
    return minWindowLength == Int(Int32.max) ? "" : String(sChars[start..<start + minWindowLength])
}
