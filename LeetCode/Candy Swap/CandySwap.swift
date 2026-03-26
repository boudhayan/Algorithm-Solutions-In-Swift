//
//  CandySwap.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 26/03/26.
//

func fairCandySwap(_ aliceSizes: [Int], _ bobSizes: [Int]) -> [Int] {
    let totalAliceCandies = aliceSizes.reduce(0, +)
    let totalBobCandies = bobSizes.reduce(0, +)
    let bobCandyBoxes = Set(bobSizes)
    for aliceCandyBox in aliceSizes {
        let aliceExpects = aliceCandyBox + (totalBobCandies - totalAliceCandies) / 2
        if bobCandyBoxes.contains(aliceExpects) {
            return [aliceCandyBox, aliceExpects]
        }
    }
    return []
}

//print(fairCandySwap([2], [1, 3]))
