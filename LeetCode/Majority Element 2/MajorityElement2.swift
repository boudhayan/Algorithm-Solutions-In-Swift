//
//  MajorityElement2.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 03/03/26.
//

func majorityElement2(_ nums: [Int]) -> [Int] {
    // there can be max 2 elements appear n/3 times
    var fm = (0, 0), sm = (0, 0)
    for num in nums {
        if num == fm.0 {
            fm.1 += 1
        } else if num == sm.0 {
            sm.1 += 1
        } else if fm.1 == 0 {
            fm.1 += 1
            fm.0 = num
        } else if sm.1 == 0 {
            sm.1 += 1
            sm.0 = num
        } else {
            fm.1 -= 1
            sm.1 -= 1
        }
    }
    var final = [Int]()
    for candidate in [fm, sm] {
        let count = nums.count{ $0 == candidate.0 && candidate.1 > 1 }
        if count > nums.count/3 {
            final.append(candidate.0)
        }
    }
    return final
}

//var arr = [0, 0, 0]
//print(majorityElement2(arr))
