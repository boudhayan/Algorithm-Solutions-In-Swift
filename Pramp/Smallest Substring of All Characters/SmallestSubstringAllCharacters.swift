//
//  SmallestSubstringAllCharacters.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/03/22.
//

import Foundation

func getShortestUniqueSubstring(arr: [Character], str: String) -> String {
    var countMap = [String: Int]()
    // initialize the count map to store the count of encountered characters
    for char in arr {
        countMap[String(char)] = 0
    }
    var leftIdx = 0
    var uniqueCharCount = 0
    var interval: [Int] = []
    var length = str.count + 1
    // scan the str from left to the right
    for rightIdx in stride(from: 0, to: str.count, by: 1) {
        let currentChar = String(str[str.index(str.startIndex, offsetBy: rightIdx)])
        // skip if char is not in the array
        if countMap[currentChar] == nil {
            continue
        }
        let charCount = countMap[currentChar]!
        if charCount == 0 {
            uniqueCharCount += 1
        }
        countMap[currentChar] = charCount + 1
        
        
        
        // squeeze the sub string to get the shortest
        while uniqueCharCount == arr.count {
            let currentLength = rightIdx - leftIdx + 1
            if currentLength < length {
                length = currentLength
                interval = [leftIdx, rightIdx]
            }
            
            
            if length == arr.count { break }
            let leftChar = String(str[str.index(str.startIndex, offsetBy: leftIdx)])
            if countMap[leftChar] == nil {
                leftIdx += 1
                continue
            }

            let leftCharCount = countMap[leftChar]!
            
            countMap[leftChar] = leftCharCount - 1
            
            if countMap[leftChar]! == 0 {
                uniqueCharCount -= 1
            }
            leftIdx += 1
        }
    }
    
    return interval.isEmpty ? "" : String(String(str[str.index(str.startIndex, offsetBy: interval[0])...str.index(str.startIndex, offsetBy: interval[1])]))
}
