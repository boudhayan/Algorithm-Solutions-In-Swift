//
//  CountAndSay.swift
//  Algorithm Solutions In Swift
//
//  Created by littlebanana on 17/03/26.
//

func countAndSay(_ n: Int) -> String {
    guard n > 1 else { return "1" }
    var current = Array("1")
    for _ in 2...n {
        var next: [Character] = []
        var i = 0
        while i < current.count {
            let key = current[i]
            var j = i
            while j < current.count, current[j] == key {
                j += 1
            }
            let count = j - i
            for digit in String(count) {
                next.append(digit)
            }
            next.append(key)

            i = j
        }
        current = next
    }
    return String(current)

}


//print(countAndSay(15))
