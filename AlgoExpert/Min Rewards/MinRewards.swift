//
//  MinRewards.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 23/03/22.
//

import Foundation

// T: O(N^2), S: O(N)
func minRewards(_ scores: [Int]) -> Int {
    // Write your code here.
    var dict = [Int : Int]()
    for num in scores { dict[num] = 1 }
    for idx in 1..<scores.count {
        var c = idx
        if scores[c] < scores[c - 1] {
            while c > 0 {
                if scores[c] < scores[c - 1]  {
                    dict[scores[c - 1]] = dict[scores[c-1]]! + 1
                }
                c -= 1
            }
        }
        c = idx
        if scores[c] > scores[c - 1] {
            dict[scores[c]] = dict[scores[c-1]]! + 1
        }
    }
    
    var rewards = 0
    for num in scores {
        rewards += dict[num]!
    }
    return rewards
}


// T: O(N), S: O(N)
func minRewards1(_ scores: [Int]) -> Int {
    var rewards = Array(repeating: 1, count: scores.count)
    for i in stride(from: 1, to: scores.count, by: 1) {
        if scores[i] > scores[i-1] {
            rewards[i] = rewards[i-1] + 1
        }
    }
    
    for i in stride(from: scores.count-2, through: 0, by: -1) {
        if scores[i] > scores[i+1] {
            rewards[i] = max(rewards[i], rewards[i + 1] + 1)
        }
    }
    return rewards.reduce(0, +)
}
