//
//  NthRoot.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 28/06/22.
//

import Foundation


func root(x: Double, n: Double) -> Double {
    if x == 1.0 { return x }
    var low = 1.0
    var high = x
    if x < 1 {
        low = 0
        high = x
    }
    var pr = (low + high) / 2
    var gap = accuracyTest(root: pr, x: x, n: n)
    while gap < -0.001 || gap > 0.001 {
        if gap < -0.001 {
            low = pr
        } else {
            high = pr
        }
        pr = (low + high) / 2
        gap = accuracyTest(root: pr, x: x, n: n)
    }
    return Double(round(pr * 1000) / 1000)
}

func accuracyTest(root: Double, x: Double, n: Double) -> Double {
    return pow(root, n) - x
}

//print(root(x: 7.0, n: 3.0))
