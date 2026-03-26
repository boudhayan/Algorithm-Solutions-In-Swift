//
//  CanConstruct.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    let ransomFreq = Dictionary(ransomNote.map { ($0, 1) }, uniquingKeysWith: +)
    let magazineFreq = Dictionary(magazine.map { ($0, 1) }, uniquingKeysWith: +)

    for (ch, needed) in ransomFreq {
        if magazineFreq[ch, default: 0] < needed {
            return false
        }
    }
    return true
}

//print(canConstruct("aa", "aab"))
