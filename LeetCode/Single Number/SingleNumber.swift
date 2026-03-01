//
//  SingleNumber.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/09/21.
//

import Foundation

fileprivate func singleNumber(_ nums: [Int]) -> Int {
      var num = nums[0]
      for idx in 1..<nums.count {
          num = num ^ nums[idx]
      }
      return num
  }
