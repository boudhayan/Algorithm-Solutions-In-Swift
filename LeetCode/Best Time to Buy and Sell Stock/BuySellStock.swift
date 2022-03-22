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
