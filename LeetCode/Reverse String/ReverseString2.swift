//
//  ReverseString.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 27/09/21.
//

import Foundation

func reverseString(_ s: inout [Character]) {
    guard s.count > 1 else { return }
    var left = 0
    var right = s.count - 1
    while left <= right {
        s.swapAt(left, right)
        left += 1
        right -= 1
    }
}
