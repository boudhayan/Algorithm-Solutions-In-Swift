//
//  ArrayPairSum.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func arrayPairSum(_ nums: [Int]) -> Int {
    var maxSum = 0
    let offset = 10000
    var container = Array(repeating: 0, count: 2 * offset + 1)
    for num in nums {
        container[num + offset] += 1
    }
    var pickNext = true
    for i in 0..<container.count {
        while container[i] > 0 {
            if pickNext {
                maxSum += i - offset
            }
            pickNext.toggle()
            container[i] -= 1
        }
    }
    return maxSum
}


//print(arrayPairSum([6,2,6,5,1,2]))
