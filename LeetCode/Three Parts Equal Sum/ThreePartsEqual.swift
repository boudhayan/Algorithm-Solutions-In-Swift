//
//  ThreePartsEqual.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func canThreePartsEqualSum(_ arr: [Int]) -> Bool {
    let total = arr.reduce(0, +)
    guard total % 3 == 0 else { return false }
    let target = total/3
    var runningSum = 0
    var found = 0
    for num in arr {
        runningSum += num
        if runningSum == target {
            found += 1
            runningSum = 0
        }
        if found == 3 { return true }
    }
    return false
}

//let arr = [0,2,1,-6,6,7,9,-1,2,0,1]
//print(canThreePartsEqualSum(arr))
