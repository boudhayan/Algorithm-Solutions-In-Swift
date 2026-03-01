//
//  NaturalNumberSum.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 15/08/21.
//

import Foundation

func sum(till number: Int) -> Int {
    if number <= 1 {
        return number
    }
    
    return sum(till: number - 1) + number
}
