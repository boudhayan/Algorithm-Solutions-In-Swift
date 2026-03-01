//
//  ArrayOfProducts.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 18/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note: 
 */
func arrayOfProducts(_ array: [Int]) -> [Int] {
    var products = Array(repeating: 1, count: array.count)
    var leftRunningProducts = Array(repeating: 1, count: array.count)
    var rightRunningProducts = Array(repeating: 1, count: array.count)
    for idx in stride(from: 1, to: array.count, by: 1) {
        leftRunningProducts[idx] = leftRunningProducts[idx - 1] * array[idx - 1]
    }
    
    for idx in stride(from: array.count - 2, through: 0, by: -1) {
        rightRunningProducts[idx] = rightRunningProducts[idx + 1] * array[idx + 1]
    }
    
    for idx in stride(from: 0, to: array.count, by: 1) {
        products[idx] = leftRunningProducts[idx] * rightRunningProducts[idx]
    }
    return products
}
