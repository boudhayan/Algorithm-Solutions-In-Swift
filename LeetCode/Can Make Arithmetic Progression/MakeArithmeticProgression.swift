//
//  MakeArithmeticProgression.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 01/03/26.
//

func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
    // In a valid AP, d = (max - min) / (n - 1) where n is the total number of elements in AP
    let min = arr.min()!, max = arr.max()!
    // if max - min is zero, then all the elements are same, so return true
    if max - min == 0 { return true }
    // if there is a remainder in (max - min) % (n - 1), means AP can't be created as diff will be in fraction
    if (max - min)%(arr.count - 1) != 0 { return false }
    let diff = (max - min) / (arr.count - 1)
    // create set and using diff check if all the elements exist
    let hashSet = Set(arr)
    for i in 0..<arr.count {
        if !hashSet.contains(min + i * diff) {
            return false
        }
    }
    return true
}
