// T: O(n1 * n2), S: O(n1 * n2)

func levenshteinDistance(firstString: String, secondString: String) -> Int {
    let firstChars = Array(firstString)
    let secondChars = Array(secondString)
    var edits = Array(repeating: Array(repeating: Int(Int32.max), count: secondString.count + 1), count: firstString.count + 1)
    edits[0][0] = 0
    for col in 1..<edits[0].count {
        edits[0][col] = edits[0][col - 1] + 1
    }
    for row in 1..<edits.count {
        edits[row][0] = edits[row - 1][0] + 1
    }
    for row in 1..<edits.count {
        let firstChar = firstChars[row - 1]
        for col in 1..<edits[0].count {
            let secondChar = secondChars[col - 1]
            if firstChar == secondChar {
                edits[row][col] = edits[row - 1][col - 1]
            } else {
                edits[row][col] = 1 + min(min(edits[row][col - 1], edits[row - 1][col - 1]), edits[row - 1][col])
            }
        }
    }
    return edits[edits.count - 1][edits[0].count - 1]
}

//print(levenshteinDistance(firstString: "abc", secondString: "yabd"))
