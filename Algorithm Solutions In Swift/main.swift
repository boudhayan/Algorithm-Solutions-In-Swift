import Foundation


//func insertionSort(array: inout [Int]) -> [Int] {
//    for idx in 1..<array.count {
//        var sortedIdx = idx - 1
//        let key = array[idx]
//        while sortedIdx >= 0, key < array[sortedIdx] {
//            array[sortedIdx + 1] = array[sortedIdx]
//            sortedIdx -= 1
//        }
//        array[sortedIdx + 1] = key
//    }
//    return array
//}



var array = [5, 3, 1, 7, 2]
recursiveInsertionSort(&array)
print(array)
