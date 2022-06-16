import Combine
import Foundation

class PlaygroundViewModel: ObservableObject {
    @Published var matrix = Array(repeating: Array(repeating: 0, count: 9), count: 15)

    init() {
    }

    func tap() {
        print("Tapped")
        if let row = Array(0..<10).randomElement(),
           let column = Array(0..<9).randomElement() {
            matrix[row][column] = 1
        }
        matrix = matrix
    }

    func horizontalDrag() {
        print("horizontal drag")
    }

    func verticalDrag() {
        print("vertical drag")
    }
}
