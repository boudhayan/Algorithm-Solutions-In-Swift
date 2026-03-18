//
//  ReverseInteger.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/10/22.
//

import Foundation

func reverse(_ x: Int) -> Int {
    var r = ""
    var num = abs(x)
    var val = 0
    while num > 0 {
        let last = num%10
        num = num/10
        r += "\(last)"
        if Int(r)! > Int32.max {
            return 0
        }
    }
    return x < 0 ? -Int(r)! : (Int(r) ?? 0)
}
