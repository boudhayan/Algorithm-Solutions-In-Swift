//
//  ConfusingNumber.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 26/03/26.
//

func confusingNumber(_ n: Int) -> Bool {
    let invalidSet: Set<Int> = [2, 3, 4, 5, 7]
    let rotatedMap = [
        0 : 0,
        1 : 1,
        6 : 9,
        8 : 8,
        9 : 6
    ]
    var num = n
    var currentNum = 0
    while num > 0 {
        let last = num % 10
        if invalidSet.contains(last) {
            return false
        }
        currentNum = currentNum * 10 + rotatedMap[last]!
        num /= 10
    }
    return currentNum != n
}


//print(confusingNumber(89))
