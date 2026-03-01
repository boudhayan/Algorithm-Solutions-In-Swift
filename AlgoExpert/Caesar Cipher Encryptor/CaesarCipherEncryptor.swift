//
//  CaesarCipherEncryptor.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 17/07/21.
//

import Foundation

/**
 Time Complexity: O(n)
 Space Complexity: O(n)
 Note: 
 */
func caesarCipherEncryptor(string: String, key: UInt32) -> String {
    var encrypted = ""
    for char in string {
        let newAsciiValue = UInt32(char.asciiValue!) + (key % 26)
        if newAsciiValue > 122 {
            encrypted += String(Character(Unicode.Scalar(96 + (newAsciiValue - 122))!))
        } else {
            encrypted += String(Character(Unicode.Scalar(newAsciiValue)!))
        }
    }
    return encrypted
}
