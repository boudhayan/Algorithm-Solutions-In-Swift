//
//  TargetIndicies.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
    var res = [Int]()
    var position = 0
    for num in nums {
        if num < target {
            position += 1
        }
    }
    for num in nums {
        if num == target {
            res.append(position)
            position += 1
        }
    }
    return res
}


//print(targetIndices([1,2,5,2,3], 2))
