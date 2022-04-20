#  Merge Sort

Divides the input array into two parts, till the sub array count is 1
Write one merge sort helper which merges two halfs in sorted order and return

`func mergeSort(_ array: [Int]) -> [Int]`
`func mergeSortHelper(_ left: [Int], _ right: [Int]) -> [Int]`

* Divide Mechanism
divide till arr.count <= 1
    st = 0, en = arr.count
    mi = st + (en - st) / 2
    left = arr[0..<mi]
    right = arr[mi..<arr.count]


Time Complexity: O(nlogn)
Space Complexity: O(n)
