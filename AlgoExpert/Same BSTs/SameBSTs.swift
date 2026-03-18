//
//  SameBSTs.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/06/22.
//

import Foundation

func sameBsts(_ arrayOne: [Int], _ arrayTwo: [Int]) -> Bool {
     if arrayOne.count == 0, arrayTwo.count == 0 {
        return true
    }
    let rootOneIdx = 0
    let rootTwoIdx = 0
    guard arrayOne.count == arrayTwo.count, arrayOne[rootOneIdx] == arrayTwo[rootTwoIdx] else {
        return false
    }
    let firstTreeLeftChildNumbers = getSmallerNumbersInOrder(array: arrayOne)
    let firstTreeRightChildNumbers = getBiggerNumbersInOrder(array: arrayOne)
    let secondTreeLeftChildNumbers = getSmallerNumbersInOrder(array: arrayTwo)
    let secondTreeRightChildNumbers = getBiggerNumbersInOrder(array: arrayTwo)
    return sameBsts(firstTreeLeftChildNumbers, secondTreeLeftChildNumbers) && sameBsts(firstTreeRightChildNumbers, secondTreeRightChildNumbers)
}

func getSmallerNumbersInOrder(array: [Int]) -> [Int] {
    var smallerNumbers = [Int]()
    for idx in 1..<array.count {
        if array[idx] < array[0] {
            smallerNumbers.append(array[idx])
        }
    }
    return smallerNumbers
}

func getBiggerNumbersInOrder(array: [Int]) -> [Int] {
    var biggerNumbers = [Int]()
    for idx in 1..<array.count {
        if array[idx] >= array[0] {
            biggerNumbers.append(array[idx])
        }
    }
    return biggerNumbers
}
