import Foundation

//************** BEGIN REVISE *************************
// 1. Count And Say
// 2. Is Ugly Number
// 3. Sort By Parity II
// 4. Missing Ranges
// 5. Array Pair Sum
//************** END REVISE ***************************



//*************** START PRACTICE *************************
func findPeakElement(_ nums: [Int]) -> Int {
    var left = 0, right = nums.count - 1
    while left >= 0, right < nums.count, left <= right {
        let mid = (left + right) / 2
        if isPeak(idx: mid) {
            return mid
        } else if mid > 0, nums[mid] < nums[mid - 1] {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return 0

    func isPeak(idx: Int) -> Bool {
        let isGreaterThanLeftNeighbour = idx == 0 ? true : nums[idx - 1] < nums[idx]
        let isGreaterThanRightNeighbour = idx == nums.count - 1 ? true : nums[idx + 1] < nums[idx]
        return isGreaterThanLeftNeighbour && isGreaterThanRightNeighbour
    }
}


print(findPeakElement([1,2]))


func shortestDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
    var i = -1, j = -1, distance = wordsDict.count
    for (idx, word) in wordsDict.enumerated() {
        if word == word1 {
            i = idx
        }
        if word == word2 {
            j = idx
        }
        if i > -1, j > -1 {
            distance = min(distance, abs(i - j))
        }

    }
    return distance
}

let words = ["practice", "makes", "perfect", "coding", "makes"]
let word1 = "makes", word2 = "coding"
//print(shortestDistance(words, word1, word2))


func confusingNumber(_ n: Int) -> Bool {
    let invalidSet: Set<Int> = [2, 3, 4, 5, 7]
    let rotatedMap = [
        0 : 0,
        1 : 1,
        6 : 9,
        8 : 8,
        9 : 6
    ]
    var num = n
    var currentNum = 0
    while num > 0 {
        let last = num % 10
        if invalidSet.contains(last) {
            return false
        }
        currentNum = currentNum * 10 + rotatedMap[last]!
        num /= 10
    }
    return currentNum != n
}


print(confusingNumber(89))

// [1, 1] [2, 2]

func fairCandySwap(_ aliceSizes: [Int], _ bobSizes: [Int]) -> [Int] {
    let totalAliceCandies = aliceSizes.reduce(0, +)
    let totalBobCandies = bobSizes.reduce(0, +)
    let bobCandyBoxes = Set(bobSizes)
    for aliceCandyBox in aliceSizes {
        let aliceExpects = aliceCandyBox + (totalBobCandies - totalAliceCandies) / 2
        if bobCandyBoxes.contains(aliceExpects) {
            return [aliceCandyBox, aliceExpects]
        }
    }
    return []
}

print(fairCandySwap([2], [1, 3]))


func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    // create custom order map
    var alienOrder = [Character : Int]()
    for (idx, char) in order.enumerated() {
        alienOrder[char] = idx
    }

    // compare adjacent words
    for i in 0..<words.count - 1 {
        let firstWord = Array(words[i])
        let secondWord = Array(words[i + 1])
        if !isOrdered(firstWord, secondWord) {
            return false
        }
    }
    return true

    func isOrdered(_ first: [Character], _ second: [Character]) -> Bool {
        let minLength = min(first.count, second.count)
        for i in 0..<minLength {
            let w1 = first[i]
            let w2 = second[i]

            if w1 != w2 {
                return alienOrder[w1]! < alienOrder[w2]!
            }
        }

        return first.count <= second.count
    }
}


let words1 = ["hello","leetcode"]
let order = "hlabcdefgijkmnopqrstuvwxyz"
print(isAlienSorted(words1, order))
