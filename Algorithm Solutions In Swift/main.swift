import Foundation



func spiralOrder1(_ matrix: [[Int]]) -> [Int] {
    var startRow = 0
    var endRow = matrix.count - 1

    var startCol = 0
    var endCol = matrix[0].count - 1

    var traversed = [Int]()

    while startRow <= endRow, startCol <= endCol {
        for col in stride(from: startCol, through: endCol, by: 1) {
            traversed.append(matrix[startRow][col])
        }

        if startRow == endRow { break }

        for row in stride(from: startRow + 1, through: endRow, by: 1) {
            traversed.append(matrix[row][endCol])
        }

        if startCol == endCol { break }
        for col in stride(from: endCol - 1, through: startCol, by: -1) {
            traversed.append(matrix[endRow][col])
        }

        for row in stride(from: endRow - 1, through: startRow + 1, by: -1) {
            traversed.append(matrix[row][startCol])
        }

        startRow += 1
        endRow -= 1

        startCol += 1
        endCol -= 1
    }
    return traversed
}
var array = [[1, 2, 3]]/*[[1,2,3,4],[5,6,7,8],[9,10,11,12]]*/
print(spiralOrder1(array))
