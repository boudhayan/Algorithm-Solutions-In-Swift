//
//  Encryption.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/07/21.
//

import Foundation


func encryption(s: String) -> String {
    let finalString = s.replacingOccurrences(of: " ", with: "")
    let sqrtVal = Double(finalString.count).squareRoot()
    var rows = Int(sqrtVal.rounded(.down))
    var cols = Int(sqrtVal.rounded(.up))
    if rows * cols < finalString.count {
        rows = max(rows, cols)
        cols = max(rows, cols)
    }
    var startIndex = 0
    var subStrings = [String]()
    for _ in 0..<rows {
        let endIndex = startIndex + cols
        let subString = finalString[startIndex..<endIndex]
        startIndex = endIndex
        var subCount = subString.count
        var finalSubStr = subString
        while subCount < cols {
            finalSubStr += " "
            subCount += 1
        }
        subStrings.append(finalSubStr)
    }
    var encodedValue = [String]()
    for col in 0..<cols {
        var str = ""
        for idx in 0..<subStrings.count {
            let subString = subStrings[idx]
            str += "\(subString[subString.index(subString.startIndex, offsetBy: col)])"
        }
        encodedValue.append(str.replacingOccurrences(of: " ", with: ""))
    }
    return encodedValue.joined(separator: " ")
}

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}
