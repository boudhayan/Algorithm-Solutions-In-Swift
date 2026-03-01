//
//  BitwiseAND.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 20/07/21.
//

import Foundation

//    print(k-1 if ((k-1) | k) <= n else k-2)


func bitwiseAND(N: Int, K: Int) -> Int {
    if ((K - 1) | K) <= N {
        return K - 1
    } else {
        return K - 2
    }
}
