//
//  AsteroidCollision.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 12/07/23.
//

import Foundation
// Question: https://leetcode.com/problems/asteroid-collision/description/
func asteroidCollision(_ asteroids: [Int]) -> [Int] {
    var stack = [Int]()
    for i in 0..<asteroids.count {
        var shouldInsert = true
        // need to run while loop till stack is not-empty to check for collision chain
        // if the top asteroid in stack is moving right and new asteroid is coming left, then only collision happens
        let comingAsteroid = asteroids[i]
        while !stack.isEmpty && (stack[stack.count - 1] > 0 && comingAsteroid < 0) {
            let topAsteroid = stack[stack.count - 1]
            // if top asteroid is lesser than coming asteroid, then top asteroid will be exploded
            // so we can remove top asteroid from stack, and continue with next asteroid in the stack
            if abs(topAsteroid) < abs(comingAsteroid) {
                stack.removeLast()
                continue
            // if top asteroid and coming asteroid are of same weight, then both them will be exploded
            // so we can pop the top asteroid from the stack and also we wont store the coming asteroid in the stack
            } else if abs(topAsteroid) == abs(comingAsteroid) {
                stack.removeLast()
            }
            // if we reach here, the current asteroid will be destroyed
            // so we should not add this asteroid to the stack
            shouldInsert = false
            break
        }
        if shouldInsert {
            stack.append(comingAsteroid)
        }
    }
  
    return stack
}

//print(asteroidCollision([-10, 2, -12, 12,-11]))
