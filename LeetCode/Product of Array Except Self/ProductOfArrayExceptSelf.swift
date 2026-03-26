//
//  ProductOfArrayExceptSelf.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/09/21.
//

import Foundation

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var leftRunningProducts = Array(repeating: 1, count: nums.count)
    var rightRunningProducts = Array(repeating: 1, count: nums.count)
    for idx in 1..<leftRunningProducts.count {
        leftRunningProducts[idx] = leftRunningProducts[idx - 1] * nums[idx - 1]
    }
    for jdx in stride(from: rightRunningProducts.count - 2, through: 0, by: -1) {
        rightRunningProducts[jdx] = rightRunningProducts[jdx + 1] * nums[jdx + 1]
    }
    var products = [Int]()
    for idx in 0..<nums.count {
        products.append(leftRunningProducts[idx] * rightRunningProducts[idx])
    }
    return products
}
