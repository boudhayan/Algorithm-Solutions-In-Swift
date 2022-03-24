//
//  main.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation
import CloudKit

var reds = [5, 5, 3, 9, 2]
var array = [1, 11, 3, 0, 15, 5, 2, 4, 10, 7, 12, 6]

var colors = [-2,1,-3,4,-1,2,1,-5,4]

func maxSubArray(_ nums: [Int]) -> Int {
      var maxSum = Int(Int32.min)
       var currentSum = 0
       for num in nums {
           currentSum = max(0, currentSum + num)
           maxSum = max(currentSum, maxSum)
       }
       return maxSum
   }

print(maxSubArray(colors))
