//
//  TaskAssignment.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/03/22.
//

import Foundation

// time complexity: O(nlogn)
// space complexity: O(n)
func taskAssignment(_ k: Int, _ tasks: [Int]) -> [[Int]] {
    let sortedTasks = tasks.sorted()
    var indexMap = [Int: [Int]]()
    for (index, value) in tasks.enumerated() {
        if indexMap[value] != nil {
            indexMap[value]!.append(index)
        } else {
            indexMap[value] = [index]
        }
    }
    var pairs = [[Int]]()
    var minIndex = 0
    var maxIndex = sortedTasks.count - 1
    while minIndex < k {
        let task1 = sortedTasks[minIndex]
        let task2 = sortedTasks[maxIndex]
        pairs.append([indexMap[task1]!.removeLast(), indexMap[task2]!.removeLast()])
        minIndex += 1
        maxIndex -= 1
    }
    return pairs
}
