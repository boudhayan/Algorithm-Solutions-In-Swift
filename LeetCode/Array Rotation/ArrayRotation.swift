//
//  ArrayRotation.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/10/22.
//

import Foundation

func arrayRotate(_ nums: inout [Int], _ k: Int) {
    guard nums.count > 1 else { return  }
    let st = (k > nums.count ? k - nums.count : k) % nums.count
    var i = 0, j = nums.count - 1
    while i < j {
        nums.swapAt(i, j)
        i += 1
        j -= 1
    }
    i = 0
    j = st - 1
    while i < j {
        nums.swapAt(i, j)
        i += 1
        j -= 1
    }
    i = st
    j = nums.count - 1
    while i < j {
        nums.swapAt(i, j)
        i += 1
        j -= 1
    }
}
