//
//  FourNumberSum.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 04/08/21.
//

import Foundation

/**
 Time Complexity: O(n^2)
 Space Complexity: O(n^2)
 Note:
 1. Time complexity is O(n^2) as there are two for loop, for each iteration of outer for loop, inner loops iterates n times.
 2: Space complexity is O(n^2) as at most you will store n * n pairs in dictionary.
  for 1 element, pairs count is 1
for 2 element, pairs count is 2
 for 3 element, pairs count is 3
 for n elements, pairs count is n
 total count is = 1 + 2+ 3 + ...+n => n*(n + 1) / 2 => O(n^2)
 */
func fourNumberSum(array: [Int], targetSum: Int) -> [[Int]] {
    var results = [[Int]]()
    // dictionary to store the pairs
    var pairs = [Int: [[Int]]]()
    // start from 1 through array.count - 1, as for the last iteration we should have two numbers, other's two if found will get from dictionary of pairs
    for i in 1..<array.count - 1 {
        // key number
        let key = array[i]
        for j in i+1..<array.count {
            // we will go thorugh from key's next position to last, to check every pairs sum
            let cs = key + array[j]
            // check remaianing sum
            let remaining = targetSum - cs
            // check if there is any existing pairs in dictionary with remaining sum as their total
            if let existing = pairs[remaining] {
                for pair in existing {
                    results.append([key, array[j]] + pair)
                }
            }
        }
        // generate all the new pairs with key as fixed number and all the of previous numbers of key
        var k = 0
        while k < i {
            let sum = array[k] + array[i]
            if let others = pairs[sum] {
                pairs[sum] = others + [[array[k], array[i]]]
            } else {
                pairs[sum] = [[array[k], array[i]]]
            }
            k += 1
        }
    }
    return results
}
