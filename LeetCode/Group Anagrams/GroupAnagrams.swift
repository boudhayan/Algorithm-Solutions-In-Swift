//
//  GroupAnagrams.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 01/10/21.
//

import Foundation

func groupAnagrams(_ strs: [String]) -> [[String]] {
    guard strs.count > 0 else { return [] }
    var dict: [String: [String]] = [:]
    for word in strs {
        var key = String(word.sorted())
        if var anagram = dict[key] {
            dict[key] = anagram + [word]
        } else {
            dict[key] = [word]
        }
    }
    var result = [[String]]()
    for key in dict.keys {
        result.append(dict[key]!)
    }
    return result
}
