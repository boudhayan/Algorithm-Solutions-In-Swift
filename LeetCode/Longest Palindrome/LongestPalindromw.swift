//
//  LongestPalindromw.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/09/21.
//

import Foundation

func longestPalindrome(_ s: String) -> Int {
    var map:[Character:Int] = [:]
    for i in s{
        if map[i] == nil{
            map[i] = 1
        }else{
            map[i]! += 1
        }
    }
    var longest = 0
    for i in map.values{
        longest += i / 2
    }
    longest *= 2
    return longest < s.count ? longest + 1 : longest
}
