//
//  FindPlayers.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 04/04/22.
//

import Foundation

/**
 Question Link: https://leetcode.com/problems/find-players-with-zero-or-one-losses/
 Time Complexity: O(N)
 Space Complexity: O(N)
 Note: N is the length of matches
 */

func findWinners(_ matches: [[Int]]) -> [[Int]] {
    var winners = [Int: Int]()
    var losers = [Int: Int]()
    for match in matches {
        let winner = match[0]
        let loser = match[1]
        if let winCount = winners[winner] {
            winners[winner] = winCount + 1
        } else {
            winners[winner] = 1
        }
        
        if let loseCount = losers[loser] {
            losers[loser] = loseCount + 1
        } else {
            losers[loser] = 1
        }
    }
    
    for loser in losers.keys {
        if winners[loser] != nil {
            winners.removeValue(forKey: loser)
        }
    }
    
    for loser in losers.keys {
        if winners[loser] != nil {
            winners.removeValue(forKey: loser)
        }
        if losers[loser]! > 1 {
            losers.removeValue(forKey: loser)
        }
    }
    for winner in winners.keys {
        if losers[winner] != nil {
            losers.removeValue(forKey: winner)
        }
    }
    
    return [Array(winners.keys).sorted(), Array(losers.keys).sorted()]
}
