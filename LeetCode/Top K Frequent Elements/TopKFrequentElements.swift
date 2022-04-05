//
//  TopKFrequentElements.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 05/04/22.
//

import Foundation

/**
 Question Link: https://leetcode.com/problems/top-k-frequent-elements/
 Time Complexity: O(nlogk)
 Space Complexity: O(n + k)
 Note: time complexity O(nlogk) when k < n and O(n) when n == k. this ensures that complexity is bette than O(nlogn)
 */

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var dict = [Int: Int]()
    for num in nums {
        if let count = dict[num] {
            dict[num] = count + 1
        } else {
            dict[num] = 1
        }
    }
    var pairs = [(Int, Int)]()
    var result = [Int]()
    
    for (k, v) in dict {
        pairs.append((k, v))
    }
    pairs.sort { $0.1 > $1.1 }
    var c = k
    var idx = 0
    while c > 0 {
        result.append(pairs[idx].0)
        c -= 1
        idx += 1
    }
    return result
}
