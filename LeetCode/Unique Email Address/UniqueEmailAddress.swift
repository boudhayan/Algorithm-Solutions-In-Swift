//
//  UniqueEmailAddress.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 19/04/22.
//

import Foundation

/**
 Question Link:
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note: n is the length of emails array
 */

func numUniqueEmails(_ emails: [String]) -> Int {
    var dict = [String: Bool]()
    for email in emails {
        let arr = email.components(separatedBy: "@")
        var localName = arr.first?.replacingOccurrences(of: ".", with: "")
        if localName != nil, let firstIndex = localName?.firstIndex(of: "+") {
            localName = localName!.replacingCharacters(in: firstIndex...localName!.index(before: localName!.endIndex), with: "")
        }

        dict[localName! + "@" + arr.last!] = true
    }
    return dict.keys.count
}

