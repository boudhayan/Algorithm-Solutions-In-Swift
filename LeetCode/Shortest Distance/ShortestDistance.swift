//
//  ShortestDistance.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 26/03/26.
//

func shortestDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
    var i = -1, j = -1, distance = wordsDict.count
    for (idx, word) in wordsDict.enumerated() {
        if word == word1 {
            i = idx
        }
        if word == word2 {
            j = idx
        }
        if i > -1, j > -1 {
            distance = min(distance, abs(i - j))
        }

    }
    return distance
}

//let words = ["practice", "makes", "perfect", "coding", "makes"]
//let word1 = "makes", word2 = "coding"
//print(shortestDistance(words, word1, word2))
