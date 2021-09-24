//
//  DesignHashMap.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 25/09/21.
//

import Foundation

class MyHashMap {

    private var array: [Int] = Array(repeating: -1, count: 10000001)
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        array[key] = value
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        return array[key]
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        array[key] = -1
    }
}
