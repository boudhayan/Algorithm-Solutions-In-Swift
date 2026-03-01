//
//  KthLargestElement.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 23/02/24.
//

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    let pivot = nums.randomElement()!
    // left -> smaller numbers than pivot
    // mid -> equal numbers to pivot
    // right -> greater numbers to pivot
    var left = [Int](), right = [Int](), mid = [Int]()
    for num in nums {
        if num > pivot {
            left.append(num)
        } else if num < pivot {
            right.append(num)
        } else {
            mid.append(num)
        }
    }
    // we will check if answer is there in left side, if left.count >= k then result is in left side
    // if left.count + mid.count is still less than k, then it means the answer is in right side (smaller // part) but then in right side we don't need to find kth largest element, instead we need to find
    // k - (left.count + mid.count)th largest element
    // if the result not in left or right, then result is the pivot element
        if left.count >= k {
        // answer is in left side
        return findKthLargest(left, k)
    } else if left.count + mid.count < k {
        // answer is in right side
        return findKthLargest(right, k - (left.count + mid.count))
    } else {
        return pivot
    }
}


//print(findKthLargest([12, 5, 16, 1, 7, 55, 27], 2))
