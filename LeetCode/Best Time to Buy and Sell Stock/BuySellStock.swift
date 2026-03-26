//
//  BuySellStock.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 23/03/22.
//

import Foundation

// T: O(N), S: O(1)
func maxProfit(_ prices: [Int]) -> Int {
    var buy = prices[0]
    var profit = 0
    for i in 1..<prices.count {
        buy = min(buy, prices[i])
        profit = max(profit, prices[i] - buy)
    }
    return profit
}

// using two pointer
func maxProfit2(_ prices: [Int]) -> Int {
    var l = 0
    var r = 1
    var maxP = 0
    while r < prices.count {
        // proftiable transaction
        if prices[l] < prices[r] {
            maxP = max(maxP, prices[r] - prices[l])
        } else {
            l = r
        }
        r += 1
    }
    return maxP
}
