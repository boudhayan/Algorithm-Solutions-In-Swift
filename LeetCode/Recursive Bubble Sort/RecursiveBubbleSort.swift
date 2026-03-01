//
//  RecursiveBubbleSort.swift
//  Algorithm Solutions In Swift
//

func recursiveBubbleSort(_ array: inout [Int]) {
    
    func helper(_ arr: inout [Int], size: Int) {
        if size == 1 {
            // array of size 1 is already sorted
            return
        }
        for i in 0..<size - 1 {
            if arr[i] > arr[i + 1] {
                arr.swapAt(i, i+1)
            }
        }
        helper(&arr, size: size - 1)
    }
    
    helper(&array, size: array.count)
}

