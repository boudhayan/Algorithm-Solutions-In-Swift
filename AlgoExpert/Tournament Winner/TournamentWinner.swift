//
//  TournamentWinner.swift
//  Algorithms In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

let HOME_TEAM_WON = 1

/**
 Time Complexity: O(N)
 Space Complexity: O(k)
 Note: where n is the number of competitions and k is the number of teams
 */
func tournamentWinner(_ competitions: [[String]], _ results: [Int]) -> String {
    var winnerTracker = [String: Int]()
    var winner: (name: String, count: Int) = ("", 0)
    for idx in 0..<competitions.count {
        let competition = competitions[idx]
        if results[idx] == HOME_TEAM_WON {
            // home team wins
            let team = competition[0]
            winnerTracker[team, default: 0] += 1
            if winnerTracker[team]! > winner.count {
                winner.name = team
                winner.count = winnerTracker[team]!
            }
        } else {
            //away team wins
            let team = competition[1]
            winnerTracker[team, default: 0] += 1
            if winnerTracker[team]! > winner.count {
                winner.name = team
                winner.count = winnerTracker[team]!
            }
        }
    }
    return winner.name
}
