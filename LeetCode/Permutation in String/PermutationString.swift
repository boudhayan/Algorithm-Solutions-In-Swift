//
//  PermutationString.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 29/09/21.
//

import Foundation

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    guard s1.count <= s2.count else { return false }
    
    var tracker = [Int](repeating: 0, count: 26)
    let aAscii = "a".first!.asciiValue ?? 0
    let s1Characters = Array(s1).map{Int(($0.asciiValue ?? 0) - aAscii)}
    let s2Characters = Array(s2).map{Int(($0.asciiValue ?? 0) - aAscii)}
    
    //Using Sliding window technique
    //Initial window
    for index in 0..<s1.count {
        tracker[s1Characters[index]] += 1
        tracker[s2Characters[index]] -= 1
    }
    if checkIfZero(tracker) {
        return true
    }
    
    //Move Window
    for index in s1.count..<s2.count {
        //Ignore previous windows first value
        tracker[s2Characters[index - s1.count]] += 1
        
        tracker[s2Characters[index]] -= 1
        
        if checkIfZero(tracker) {
            return true
        }
    }
    return false
}
    
func checkIfZero(_ tracker: [Int]) -> Bool {
    for i in 0..<tracker.count {
        if tracker[i] != 0  {
            return false
        }
    }
    return true;
}
