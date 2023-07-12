//
//  Dota2Senate.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 12/07/23.
//

import Foundation
// https://leetcode.com/problems/dota2-senate/description/?envType=study-plan-v2&envId=leetcode-75
func predictPartyVictory(_ senate: String) -> String {
    var radiantQueue = [Int]()
       var direQueue = [Int]()
       let votersCount = senate.count
    // store the indices of the voters in two dfifferent queue
    // they will be in sorted order
       for i in 0..<votersCount {
           if senate[senate.index(senate.startIndex, offsetBy: i)] == "R" {
               radiantQueue.append(i)
           } else {
               direQueue.append(i)
           }
       }
       // since voters will be banning each other, we need to continue until one of them becomes empty
       while radiantQueue.count > 0 && direQueue.count > 0 {
           // the current voter will be minimum of the first element of the two queues
           // the banned senator will be the maximum of the first element of the two queues, as it is the
           // nearest oppponent of the current voter in the original senate string
           let radiantVoter = radiantQueue.removeFirst()
           let direVoter = direQueue.removeFirst()
           // the current voter will ban the nearest opponent party senator, and the winner will get it's turn
           // again in the next round of voting.
           // so we are adding (index + votersCount) to make sure that winner only gets it's turn in next round
           // example- for three senators if R = [0],D = [1, 2] are indices, 0 will win and will be enqueued
           // again in the queue, so (0 + senatorCount) => 3 is the new index, it makes sure that this winner
           // will get turn again in the next round of voting only.
           if radiantVoter < direVoter {
               radiantQueue.append(radiantVoter + votersCount)
           } else {
               direQueue.append(direVoter + votersCount)
           }
       }
       return radiantQueue.count == 0 ? "Dire" : "Radiant"
}

print(predictPartyVictory("RDD"))

