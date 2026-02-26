//
//  RecusriveInsertionSort.swift
//  Algorithm Solutions In Swift
//

func recursiveInsertionSort(_ array: inout [Int]) {
    
    func helper(_ array: inout [Int], currentIdx: Int) {
        if currentIdx == array.count {
            return
        }
        var sortedIdx = currentIdx - 1
        let key = array[currentIdx]
        while sortedIdx >= 0, array[sortedIdx] > key {
            array[sortedIdx + 1] = array[sortedIdx]
            sortedIdx -= 1
        }
        array[sortedIdx + 1] = key
        helper(&array, currentIdx: currentIdx + 1)
    }
    
    helper(&array, currentIdx: 1)
}
