//
//  ValidIPAddresses.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 15/04/22.
//

import Foundation

/**
 Time Complexity: O(1)
 Space Complexity: O(1)
 Note: maximum 2^32 IP addresses are possible
 */
func validIPAddresses(_ string: String) -> [String] {
    var addresses = [String]()
    for i in stride(from: 0, to: min(string.count, 4), by: 1) {
        let firstPart = String(string[string.startIndex...string.index(string.startIndex, offsetBy: i)])
        if !isIPAddressPartValid(firstPart) {
            continue
        }
        for j in stride(from: i + 1, to: i + min(string.count - i, 4), by: 1) {
            let secondPart = String(string[string.index(string.startIndex, offsetBy: i + 1)...string.index(string.startIndex, offsetBy: j)])
            if !isIPAddressPartValid(secondPart) {
                continue
            }
            
            for k in stride(from: j + 1, to: j + min(string.count - j, 4), by: 1) {
                let thirdPart = String(string[string.index(string.startIndex, offsetBy: j + 1)...string.index(string.startIndex, offsetBy: k)])
                let fourthPart = String(string[string.index(string.startIndex, offsetBy: k + 1)..<string.endIndex])
                if !isIPAddressPartValid(thirdPart) || !isIPAddressPartValid(fourthPart) {
                    continue
                }
                addresses.append([firstPart, secondPart, thirdPart, fourthPart].joined(separator: "."))
            }
        }
    }
    return addresses
}


func isIPAddressPartValid(_ string: String) -> Bool {
    return string.count > 0 && Int(string)! <= 255 && String(Int(string)!).count == string.count
}
