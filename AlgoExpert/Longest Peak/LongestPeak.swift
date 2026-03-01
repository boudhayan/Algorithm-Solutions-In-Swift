//
//  LongestPeak.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 23/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(1)
 Note: 
 */
func longestPeak(array: [Int]) -> Int {
    guard array.count > 2 else { return -1 }
    var maxPeakLength = -1
    var start = 1
    while start < array.count - 1 {
        if array[start] > array[start - 1], array[start] > array[start + 1] {
            // found a peak
            var peakLength = 3
            var leftStart = start - 1
            var rightStart = start + 1
            while leftStart >= 0, array[leftStart] > array[leftStart - 1] {
                peakLength += 1
                leftStart -= 1
            }
            while rightStart < array.count - 1, array[rightStart] > array[rightStart + 1] {
                peakLength += 1
                rightStart += 1
            }
            start = rightStart
            maxPeakLength = max(maxPeakLength, peakLength)
        }
        start += 1
    }
    return maxPeakLength
}
