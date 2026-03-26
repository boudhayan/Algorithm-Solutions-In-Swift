//
//  MissingRanges.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [[Int]] {
    var result = [[Int]]()
    var nextExpected = lower

    for num in nums {
        // If the current number is greater than what we expect,
        // there is a gap between nextExpected and num - 1
        if num > nextExpected {
            result.append([nextExpected, num - 1])
        }

        // Update nextExpected to the number right after the current one
        nextExpected = num + 1
    }

    // Final check: Is there a gap between the last element and 'upper'?
    if nextExpected <= upper {
        result.append([nextExpected, upper])
    }

    return result
}

//print(findMissingRanges([0,1,3,50,75], 0, 99))
