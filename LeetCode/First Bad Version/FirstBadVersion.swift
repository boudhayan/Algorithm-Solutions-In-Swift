//
//  FirstBadVersion.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 24/09/21.
//

import Foundation

func firstBadVersion(_ n: Int) -> Int {
    var low = 1
    var high = n
    var badVersion = n
    while low <= high {
        let mid = low + (high - low) / 2
        if isBadVersion(mid) {
            high = mid - 1
            badVersion = min(badVersion, mid)
        } else {
            low = mid + 1
        }
    }
    return badVersion
}

func isBadVersion(_ version: Int) -> Bool {
    //implementation needed
    return true
}
