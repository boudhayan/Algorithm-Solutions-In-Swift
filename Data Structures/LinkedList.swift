//
//  LinkedList.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 22/07/21.
//

import Foundation

class LinkedList<Element: Comparable> {
    var value: Element
    var next: LinkedList?
    
    init(value: Element) {
        self.value = value
        self.next = nil
    }
}


