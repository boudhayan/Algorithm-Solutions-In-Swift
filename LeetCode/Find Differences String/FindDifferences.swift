//
//  FindDifferences.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func findTheDifference(_ s: String, _ t: String) -> Character {
    var sContainer: [Int] = Array(repeating: 0, count: 26)
    var tContainer: [Int] = Array(repeating: 0, count: 26)

    for char in s {
        sContainer[Int(char.asciiValue ?? 0)%97] += 1
    }
    for char in t {
        tContainer[Int(char.asciiValue ?? 0)%97] += 1
    }
    var i = 0, j = 0
    while i < sContainer.count, j < tContainer.count {
        if sContainer[i] != tContainer[j] {
            return Character(UnicodeScalar(97+i)!)
        }
        i += 1
        j += 1
    }
    return Character("")
}

func findTheDifferenceXOR(_ s: String, _ t: String) -> Character {
    var xorValue: UInt8 = 0
    for byte in s.utf8 {
        xorValue ^= byte
    }
    for byte in t.utf8 {
        xorValue ^= byte
    }
    return Character(UnicodeScalar(xorValue))
}

//print(findTheDifferenceXOR("abcd", "abcde"))
