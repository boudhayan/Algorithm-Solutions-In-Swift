//
//  SortArrayByParityII.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func sortArrayByParityII(_ nums: [Int]) -> [Int] {
    var arr = nums
    var oddIndex = 1

    for evenIndex in stride(from: 0, to: arr.count, by: 2) {
        if arr[evenIndex] % 2 != 0 {
            while arr[oddIndex] % 2 != 0 {
                oddIndex += 2
            }
        }
        arr.swapAt(evenIndex, oddIndex)
    }
    return arr
}


//print(sortArrayByParityII(
//    [3,0,4,0,2,1,3,1,3,4]
//
//))
