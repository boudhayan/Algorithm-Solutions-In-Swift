//
//  StaircaseTraversal.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 16/06/22.
//

import Foundation

func staircaseTraversal(_ height: Int, _ maxSteps: Int) -> Int {
    var steps = [Int](repeating: 0, count: height + 1)
    steps[0] = 1
    steps[1] = 1
    for idx in 2..<steps.count {
        var stepTaken = 1
        while idx - stepTaken >= 0, stepTaken <= maxSteps {
            steps[idx] += steps[idx - stepTaken]
            stepTaken += 1
        }
    }
    return steps[height]
}
