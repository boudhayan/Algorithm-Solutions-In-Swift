//
//  FixedPoint.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func fixedPoint(_ arr: [Int]) -> Int {
    var i = 0, j = arr.count - 1
    var smallestIndex = arr.count
    while i <= j {
        let mid = (i + j) / 2
        if mid == arr[mid] {
            smallestIndex = min(smallestIndex, mid)
            j = mid - 1
        } else if arr[mid] < mid {
            i = mid + 1
        } else {
            j = mid - 1
        }
    }
    return smallestIndex == arr.count ? -1 : smallestIndex
}


//print(fixedPoint([-10,-5,-2,0,4,5,6,7,8,9,10]))
