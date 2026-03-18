//
//  MaxDistanceColors.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 18/03/26.
//

func maxDistance(_ colors: [Int]) -> Int {
    var l = 0, r = colors.count - 1
    while colors[l] == colors[r] {
        r -= 1
    }
    let leftDistance = r - l
    l = 0
    r = colors.count - 1
    while colors[l] == colors[r] {
        l += 1
    }
    let rightDistance = r - l
    return max(leftDistance, rightDistance)
}


//print(maxDistance([4,4,4,11,4,4,11,4,4,4,4,4]
//
//))
