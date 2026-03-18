//
//  RandomizedSet.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 01/08/23.
//

import Foundation

// Time complexity is O(1) for all set operations
// Space complexity is O(N) to store N elements in internal storage.
class RandomizedSet {
    
    private var storageSet = Set<Int>()
    
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        return storageSet.insert(val).inserted
    }
    
    func remove(_ val: Int) -> Bool {
        if storageSet.contains(val) {
            storageSet.remove(val)
            return true
        }
        return false
    }
    
    func getRandom() -> Int {
        let idx = Int.random(in: 0...storageSet.count)
        return storageSet[storageSet.index(storageSet.startIndex, offsetBy: idx)]
    }
}
