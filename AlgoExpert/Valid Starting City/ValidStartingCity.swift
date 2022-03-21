//
//  ValidStaringCity.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 21/03/22.
//

import Foundation

// time complexity: O(n)
// space complexity: O(1)

func validStartingCity(_ distances: [Int], _ fuel: [Int], _ mpg: Int) -> Int {
    
    let availableFuels = fuel.map { $0 * mpg }
    var requiredFuel = 0
    var extraFuel = 0
    var startingCity = 0
    for idx in 0..<distances.count {
        let extraFuelAtCurrentCity = (availableFuels[idx] + extraFuel) - distances[idx]
        if extraFuelAtCurrentCity < 0 {
            requiredFuel += extraFuelAtCurrentCity
            startingCity = idx + 1
        } else {
            extraFuel = extraFuelAtCurrentCity
        }
    }
    if extraFuel - requiredFuel >= 0 { return startingCity }
    return -1
}
