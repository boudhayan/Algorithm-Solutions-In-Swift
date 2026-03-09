//
//  FirstIndexOfString.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/10/22.
//

import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.isEmpty { return 0 }
    if needle.count > haystack.count { return -1 }
    var firstIndex = 0
    var rangeStartIndex = haystack.startIndex
    var rangeEndIndex = haystack.index(rangeStartIndex, offsetBy: needle.count - 1)
    while rangeEndIndex < haystack.endIndex {
        let substring = haystack[rangeStartIndex...rangeEndIndex]
        if substring == needle {
            return firstIndex
        }
        rangeStartIndex = haystack.index(after: rangeStartIndex)
        rangeEndIndex = haystack.index(after: rangeEndIndex)
        firstIndex += 1
    }
    return -1
}
