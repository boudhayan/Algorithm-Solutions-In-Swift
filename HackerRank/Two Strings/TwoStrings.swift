//
//  TwoStrings.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 19/09/21.
//

import Foundation

//https://www.hackerrank.com/challenges/two-strings/problem?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=24-hour-campaign

func twoStrings(s1: String, s2: String) -> String {
    // Write your code here
    let a1 = Array(s1)
    let a2 = Set(Array(s2))
    let d1 = Dictionary(uniqueKeysWithValues: a2.map{ ($0, true) })

    for ele in a1 {
        if let isExist = d1[ele], isExist {
            return "YES"
        }
    }
    return "NO"
}
