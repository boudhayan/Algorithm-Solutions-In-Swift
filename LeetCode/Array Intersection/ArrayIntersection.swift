//
//  ArrayIntersection.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
    var p1 = 0, p2 = 0, p3 = 0
    var intersections = [Int]()
    while p1 < arr1.count, p2 < arr2.count, p3 < arr3.count {
        if arr1[p1] == arr2[p2], arr2[p2] == arr3[p3] {
            intersections.append(arr1[p1])
            p1 += 1
            p2 += 1
            p3 += 1
        } else {
            if arr1[p1] < arr2[p2] {
                p1 += 1
            } else if arr2[p2] < arr3[p3] {
                p2 += 1
            } else {
                p3 += 1
            }
        }
    }
    return intersections
}
