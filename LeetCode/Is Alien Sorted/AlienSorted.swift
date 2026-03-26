//
//  AlienSorted.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 26/03/26.
//

func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    // create custom order map
    var alienOrder = [Character : Int]()
    for (idx, char) in order.enumerated() {
        alienOrder[char] = idx
    }

    // compare adjacent words
    for i in 0..<words.count - 1 {
        let firstWord = Array(words[i])
        let secondWord = Array(words[i + 1])
        if !isOrdered(firstWord, secondWord) {
            return false
        }
    }
    return true

    func isOrdered(_ first: [Character], _ second: [Character]) -> Bool {
        let minLength = min(first.count, second.count)
        for i in 0..<minLength {
            let w1 = first[i]
            let w2 = second[i]

            if w1 != w2 {
                return alienOrder[w1]! < alienOrder[w2]!
            }
        }

        return first.count <= second.count
    }
}


//let words1 = ["hello","leetcode"]
//let order = "hlabcdefgijkmnopqrstuvwxyz"
//print(isAlienSorted(words1, order))
