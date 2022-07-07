import Foundation

func rotate(matrix: [[Int]]) -> [[Int]] {
    
    let row = matrix.count
    let col = matrix[0].count
    
    var temp_matrix = Array(repeating: Array(repeating: 0, count: row), count: col)
    
    for i in 0..<row {
        for j in 0..<col {
            temp_matrix[j][row - 1 - i] = matrix[i][j]
        }
    }
    
    
    return temp_matrix
}


