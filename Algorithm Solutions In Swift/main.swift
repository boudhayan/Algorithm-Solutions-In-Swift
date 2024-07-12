
import Foundation

let arr = [2, 1, 5, 6, 2, 3, 1]

func findLeftSmaller(_ heights: [Int]) -> [Int] {
    var res = [Int](repeating: 0, count: heights.count)
    var stack = [Int]()
    for i in 0..<heights.count {
        var j = stack.count - 1
        while !stack.isEmpty, heights[stack[j]] >= heights[i] {
            j -= 1
            stack.removeLast()
        }
        res[i] = stack.isEmpty ? 0 : stack[stack.count - 1] + 1
        stack.append(i)
    }
    return res
}

func findRightSmaller(_ heights: [Int]) -> [Int] {
    var res = [Int](repeating: 0, count: heights.count)
    var stack = [Int]()
    for i in stride(from: heights.count - 1, through: 0, by: -1) {
        var j = stack.count - 1
        while !stack.isEmpty, heights[stack[j]] >= heights[i] {
            j -= 1
            stack.removeLast()
        }
        res[i] = stack.isEmpty ? heights.count - 1 : stack.last! - 1
        stack.append(i)
    }
    return res
}

print(findLeftSmaller(arr))
print(findRightSmaller(arr))


func largestRectangleArea(_ heights: [Int]) -> Int {
    var stack = [Int]()
    var maxArea = 0
    for i in 0...heights.count {
        while !stack.isEmpty && (i == heights.count || heights[i] <= heights[stack[stack.count - 1]]) {
            let currentHeight = heights[stack[stack.count - 1]]
            stack.removeLast()
            let width = stack.isEmpty ? i : i - stack[stack.count - 1] - 1
            maxArea = max(maxArea, width * currentHeight)
        }
        stack.append(i)
    }
    return maxArea
}


func maximalRectangle(_ matrix: [[Character]]) -> Int {
    var maxArea = 0
    for row in 0..<matrix.count {
        var histogram = [Int](repeating: 0, count: matrix[0].count)
        for column in 0..<matrix[0].count {
            var r = row
            while r >= 0, matrix[r][column] == "1" {
                histogram[column] += Int(String(matrix[r][column]))!
                r -= 1
            }
        }
        maxArea = max(maxArea, largestRectangleArea(histogram))
    }
    return maxArea
}
print(maximalRectangle([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]))

private class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(val: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

private func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
    if depth - 1 == 0 {
        let newRoot = TreeNode(val: val)
        newRoot.left = root?.left
        newRoot.right = root?.right
        return newRoot
    }
    
    helper(parent: nil, current: root, visitingDepth: 0)
    
    func helper(parent: TreeNode?, current: TreeNode?, visitingDepth: Int) {
        if visitingDepth == depth - 1 {
            if parent == nil {
                return
            }
            if current == nil {
                parent?.left = TreeNode(val: val)
                parent?.right = TreeNode(val: val)
                return
            }
            if parent?.left === current {
                parent?.left = TreeNode(val: val)
                parent?.left?.left = current
            }
            if parent?.right === current {
                parent?.right = TreeNode(val: val)
                parent?.right?.right = current
            }
            return
        }
        helper(parent: current, current: current?.left, visitingDepth: visitingDepth + 1)
        helper(parent: current, current: current?.right, visitingDepth: visitingDepth + 1)
        
    }
    return root
}




func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
    var paths: [Int: [Int]] = [:]
    for i in 0..<edges.count {
        let (edge1, edge2) = (edges[i][0], edges[i][1])
        paths[edge1, default: []].append(edge2)
        paths[edge2, default: []].append(edge1)
    }
    var queue = paths[source]!
    var cache = [Bool](repeating: true, count: n)
    cache[source] = false
    while !queue.isEmpty {
        let queueCount = queue.count
        for i in 0..<queueCount {
            let destinationFromCurrent = queue.removeFirst()
            if destinationFromCurrent == destination {
                return true
            }
            if cache[destinationFromCurrent] {
                cache[destinationFromCurrent] = false
                queue.append(contentsOf: paths[destinationFromCurrent]!)
            }
        }
    }
    return false
}

print(validPath(3, [[0,1],[1,2],[2,0]], 0, 2))


func openLock(_ deadends: [String], _ target: String) -> Int {
    var visited = Set(deadends)
    guard !visited.contains("0000") else { return -1 }
    var queue = [(String, Int)]()   // current combination, number of turns to reach here
    queue.append(("0000", 0))
    while !queue.isEmpty {
        let element = queue.removeFirst()
        let (combination, turns) = (element.0, element.1)
        visited.insert(combination)
        if combination == target {
            return turns
        }
        for child in children(combination) {
            if !visited.contains(child) {
                queue.append((child, turns + 1))
            }
        }
    }
    return -1
}


func children(_ combination: String) -> [String] {
    var lockCombination = Array(combination)
    var combinations = [String]()
    for i in 0..<4 {
        let current = Int("\(lockCombination[i])")!
        // incremented by 1
        let forwardCurrent =  String(lockCombination[0..<i]) +  "\((current + 1) % 10)" + String(lockCombination[i + 1..<lockCombination.count])
        combinations.append(forwardCurrent)
        // decremented by 1
        let backwardCurrent = String(lockCombination[0..<i]) +  "\(((current - 1) + 10) % 10)" + String(lockCombination[i + 1..<lockCombination.count])
        combinations.append(backwardCurrent)
    }
    return combinations
}


print(openLock(["0201","0101","0102","1212","2002"], "0202"))


func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var adj = [Int: [Int]]()
    var degrees = [Int](repeating: 0, count: n)
    for edge in edges {
        adj[edge[0], default: []].append(edge[1])
        degrees[edge[0]] += 1
        adj[edge[1], default: []].append(edge[0])
        degrees[edge[1]] += 1
    }
    var queue = [Int]()
    var mhts = [Int]()
    for (idx, degree) in degrees.enumerated() where degree == 1 {
        queue.append(idx)
        degrees[idx] -= 1
    }
    while !queue.isEmpty {
        let totalCount = queue.count
        mhts.removeAll()
        for i in 0..<totalCount {
            let removedVertex = queue.removeFirst()
            let connectedVertices = adj[removedVertex]!
            mhts.append(removedVertex)
            for connectedVertex in connectedVertices {
                degrees[connectedVertex] -= 1
                if degrees[connectedVertex] == 1 {
                    queue.append(connectedVertex)
                }
            }
        }
    }
    return mhts
}

print(findMinHeightTrees(4, [[1,0],[1,2],[1,3]]))


func findRotateSteps(_ ring: String, _ key: String) -> Int {
    let ringChars = Array(ring)
    let keyChars = Array(key)
    var cache = [[Int]: Int]()
    func helper(r: Int, k: Int) -> Int {
        if k == keyChars.count {
            return 0
        }
        if let steps = cache[[r, k]] {
            return steps
        }
        var res = Int(Int32.max)
        for (i, v) in ringChars.enumerated() {
            if v == keyChars[k] {
               // clock wise
                let clockwiseSteps = abs(r - i)
                let antiClockwiseSteps = abs(ringChars.count - clockwiseSteps)
                let minimumSteps = min(clockwiseSteps, antiClockwiseSteps)
                res = min(res, 1 + minimumSteps + helper(r: i, k: k + 1))
                cache[[r, k]] = res
            }
        }
        return res
    }
    return helper(r: 0, k: 0)
}


func allPermutations(_ arr: [Int]) -> [[Int]] {
    var res = [[Int]]()
    var comb = [Int]()
    func helper(current: inout [Int]) {
        if arr.count == current.count {
            // do something
            res.append(current)
            return
        }
        for j in 0..<arr.count {
            if !current.contains(where: { $0 == arr[j] }) {
                current.append(arr[j])
                helper(current: &current)
                current.removeLast()
            }
        }
    }
    helper(current: &comb)
    return res
}


print(allPermutations([1, 2, 3]))



func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
    guard n > 1 else { return [0] }
    var distances = [Int](repeating: 0, count: n)
    var adj = [Int: [Int]]()
    for edge in edges {
        adj[edge[0], default: []].append(edge[1])
        adj[edge[1], default: []].append(edge[0])
    }
    for node in 0..<n {
        var queue = adj[node]!.map { ($0, 1) }
        var res = 0
        var visited = Set<Int>()
        visited.insert(node)
        while !queue.isEmpty {
            let front = queue.removeFirst()
            if !visited.contains(front.0) {
                visited.insert(front.0)
                res += front.1
                let others = adj[front.0]!.map { ($0, front.1 + 1)}
                queue.append(contentsOf: others)
            }
        }
        distances[node] = res
    }
    return distances
}


print(sumOfDistancesInTree(2, [[1,0]]))


func wonderfulSubstrings(_ word: String) -> Int {
    let chars = Array(word)
    var cache = Set<Character>()
    var res = 0
    func helper(start: Int, current: Int) {
        if current == chars.count || start == chars.count {
            cache.removeAll()
            return
        }
        if cache.contains(chars[current]) {
            cache.remove(chars[current])
        } else {
            cache.insert(chars[current])
        }
        
        if cache.count % 2 == 1 {
            res += 1
        }
        helper(start: start, current: current + 1)
    }
    helper(start: 0, current: 0)
    return -1
}

print(wonderfulSubstrings("aba"))

func reversePrefix(_ word: String, _ ch: Character) -> String {
    var last = -1
    var chars = Array(word)
    for (i, v) in chars.enumerated() where v == ch {
        last = i
        break
    }
    var first = 0
    while first < last {
        chars.swapAt(first, last)
        first += 1
        last -= 1
    }
    return String(chars)
}

print(reversePrefix("abcdefd", "d"))

private class ListNode {
    var val: Int
    var next: ListNode?
    
    init(val: Int, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

private func doubleIt(_ head: ListNode?) -> ListNode? {
    var current = head
    var prev: ListNode? = nil
    while current != nil {
        let temp = current?.next
        current?.next = prev
        prev = current
        current = temp
    }
    
    current = prev
    var revHead = current
    var carry = 0
    while current != nil {
        let newVal = current!.val * 2 + carry
        carry = newVal/10
        current?.val = newVal%10
        prev = current
        current = current?.next
    }
    if carry > 0 {
        prev?.next = ListNode(val: carry)
    }
    current = revHead
    prev = nil
    while current != nil {
        let temp = current?.next
        current?.next = prev
        prev = current
        current = temp
    }
    return prev
}


private var ll = ListNode(val: 9)
ll.next = ListNode(val: 9)
ll.next?.next = ListNode(val: 9)

private func trav(_ head: ListNode?) {
    var current = head
    while let node = current {
        print(node.val)
        current = current?.next
    }
}

trav(doubleIt(ll))

func getMaximumGold(_ grid: [[Int]]) -> Int {
    var res = 0
    let ROWS = grid.count, COLS = grid[0].count
    func dfs(r: Int, c: Int, visited: inout Set<[Int]>) -> Int {
        if r < 0 || c < 0 || r == ROWS || c == COLS || grid[r][c] == 0 || visited.contains([r, c]) {
            return 0
        }
        visited.insert([r, c])
        var res = grid[r][c]
        let neighbours = [[r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]]
        for neighbour in neighbours {
            res = max(res, grid[r][c] + dfs(r: neighbour[0], c: neighbour[1], visited: &visited))
        }
        visited.remove([r, c])
        return res
    }
    
    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            var visited = Set<[Int]>()
            res = max(res, dfs(r: row, c: col, visited: &visited))
        }
    }
    return res
}


print(getMaximumGold([[0,6,0],[5,8,7],[0,9,0]]))


private func evaluateTree(_ root: TreeNode?) -> Bool {
    
    func helper(_ node: TreeNode?) -> Bool {
        if node?.left == nil, node?.right == nil {
            return node!.val == 1 ? true : false
        }
        if node!.val == 2 {
            return helper(node?.left) || helper(node?.right)
        } else {
            return helper(node?.left) && helper(node?.right)
        }
    }
    
    return helper(root)
}

private let b = TreeNode(val: 1)
b.left = TreeNode(val: 2)
b.left?.left = TreeNode(val: 2)
//b.right = TreeNode(val: 3)
//b.right?.left = TreeNode(val: 0)
//b.right?.right = TreeNode(val: 1)



private func subsets1(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    var curr = [Int]()
    func helper(first: Int = 0, curr: inout [Int], size: Int) {
        if size == curr.count {
            res.append(curr)
            return
        }
        for i in first..<nums.count {
            curr.append(nums[i])
            helper(first: i + 1, curr: &curr, size: size)
            curr.removeLast()
        }
    }
    
    for s in 0...nums.count {
        helper(curr: &curr, size: s)
    }
    return res
}

print(subsets1([1, 2, 3]))


func specialArray(_ nums: [Int]) -> Int {
    let arr = nums.sorted()
    var guess = nums.count
    while guess > 0 {
        var l = 0
        var r = arr.count - 1
        while r < arr.count, l < r {
            let m = (l + r) / 2
            if arr[m] >= guess {
                r = m
            } else {
                l = m + 1
            }
        }
        if arr[l] >= guess, nums.count - r == guess {
            break
        }
        guess -= 1
    }
    return guess == 0 ? -1 : guess
}


print(specialArray([3,9,7,8,3,8,6,6]))

func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
    var words = [String]()
    for word in sentence.components(separatedBy: " ") {
        var newWord = word
        for dictWord in dictionary where word.hasPrefix(dictWord) && dictWord.count < newWord.count {
            newWord = dictWord
        }
            words.append(newWord)
        }
    return words.joined(separator: " ")
}


print(replaceWords(["a", "aa", "aaa", "aaaa"], "a aa a aaaa aaa aaa aaa aaaaaa bbb baba ababa"))



func judgeSquareSum(_ c: Int) -> Bool {
    var high = Int(ceil(sqrt(Double(c))))
    var low = 0
    while low <= high {
        let num = low * low + high * high
        if num < c {
            low += 1
        } else if num > c {
            high -= 1
        } else {
            return true
        }
    }
    return false
}


print(judgeSquareSum(4))


func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
    var netProfit = 0
    let arr = zip(difficulty, profit).sorted { $0.0 > $1.0 }
    for work in worker {
        var low = 0
        var high = arr.count - 1
        var jobProfit = 0
        while low <= high {
            let mid = (low + high) / 2
            if arr[mid].0 <= work {
                jobProfit = max(jobProfit, arr[mid].1)
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        netProfit += jobProfit
    }
    return netProfit
}

print(maxProfitAssignment([2,4,6,8,10], [10,20,30,40,50], [4,5,6,7]))

func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
    var res = 0
    var odd = 0
    var l = 0, m = 0
    for r in 0..<nums.count {
        if nums[r] % 2 == 1 {
            odd += 1
        }
        while odd > k {
            if nums[l] % 2 == 1 {
                odd -= 1
            }
            l += 1
            m = l
        }
        
        if odd == k {
            while nums[m] % 2 != 1 {
                m += 1
            }
            res += m - l + 1
        }
    }
    return res
}


func minDifference(_ nums: [Int]) -> Int {
    var arr = nums.sorted()
    var c = 0
    while c < 3 {
        arr[arr.count - 1 - c] = arr[0]
        c += 1
    }
    return arr[arr.count - 1 - 3] - arr[0]
}

print(minDifference([6,6,0,1,1,4,6]))
//0, 1, 1, 4, 6, 6, 6

private func nodesBetweenCriticalPoints(_ head: ListNode?) -> [Int] {
    var previous: ListNode? = head
    var current: ListNode? = head?.next
    var dist = 1
    var criticalCount = 0
    var first = 0
    var last = 0
    var minDistance = Int(Int32.max)
    while let previosNode = previous, let currentNode = current, let nextNode = current?.next {
        if (currentNode.val > previosNode.val && currentNode.val > nextNode.val) || (currentNode.val < previosNode.val && currentNode.val < nextNode.val) {
            // found local maxima or minima
            if first == 0 {
                first = dist
            } else if first > 0 || last > 0 {
                minDistance = min(minDistance, dist - max(first, last))
                last = dist
            }
            
            criticalCount += 1
        }
        dist += 1
        previous = currentNode
        current = currentNode.next
    }
    return criticalCount < 2 ? [-1, -1] : [minDistance, last - first]
}

private let ll1 = ListNode(val: 1)
ll1.next = ListNode(val: 3)
ll1.next?.next = ListNode(val: 2)
ll1.next?.next?.next = ListNode(val: 2)
ll1.next?.next?.next?.next = ListNode(val: 3)
ll1.next?.next?.next?.next?.next = ListNode(val: 2)

print(nodesBetweenCriticalPoints(ll1))

func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
    var res = numBottles
    var totalBottles = numBottles
    while totalBottles >= numExchange {
        let drunk = totalBottles / numExchange
        res += drunk
        totalBottles = (totalBottles % numExchange) + (totalBottles / numExchange)
    }
    return res
}

print(numWaterBottles(15, 4))

func averageWaitingTime(_ customers: [[Int]]) -> Double {
    var currentTime = 0
    var totalWaitTime = 0
    for i in 0..<customers.count {
        let customer = customers[i]
        let actualStartTime = customer[0], duration = customer[1]
        var waitTime = 0
        if currentTime < actualStartTime {
            waitTime = duration
            currentTime = actualStartTime + duration
        } else {
            waitTime = currentTime + duration - actualStartTime
            currentTime = currentTime + duration
        }
        totalWaitTime += waitTime
    }
    return Double(totalWaitTime) / Double(customers.count)
}


print(averageWaitingTime([[5,2],[5,4],[10,3],[20,1]]))
