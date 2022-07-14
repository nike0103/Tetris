import Combine
import Foundation

typealias Coordinates = (x: Int, y: Int)

class PlaygroundViewModel: ObservableObject {
    static let columns = 9
    static let rows = 15
    @Published var matrix = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    var timer = Timer()
    private let blocksManager: BlocksManager
    private var blockPosition: Coordinates = (x: -1, y: -1)
    private var currentBlock: BlockProtocol = BlockShape.Box.block

    init(blocksManager: BlocksManager = BlocksManager.shared) {
        self.blocksManager = blocksManager
    }

    deinit {
        timer.invalidate()
    }

    func onViewAppear() { // Verify: What happens when we come back from pause screen
        dropNewBlock()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(moveBlockVertically), userInfo: nil, repeats: true)
    }

    private func dropNewBlock() {
        currentBlock = blocksManager.pop()
        blockPosition = (x: Self.columns/2, y: 0)
    }

    func tap() {
       // rotate
//        let newBlock = currentBlock.rotateMatrix()
        // clear play view
        // conflict
        // paint new block
    }

    func horizontalDrag() {
        let temp_matrix = giveMatrixWithoutBlock()
        let newPosition = (blockPosition.x + 1, blockPosition.y)
        if !isConflict(temp_matrix, newPosition: newPosition) {
            updateBlockPosition(temp_matrix, newPosition: newPosition, block: currentBlock)
        }
    }

    func verticalDrag() {
        print("vertical drag")
    }

    @objc private func moveBlockVertically() {
        let temp_matrix = giveMatrixWithoutBlock()
        let newPosition = (x: blockPosition.x, y: blockPosition.y + 1)
        if !isConflict(temp_matrix, newPosition: newPosition) {
            updateBlockPosition(temp_matrix, newPosition: newPosition, block: currentBlock)
        } else {
            dropNewBlock()
        }
    }

    private func giveMatrixWithoutBlock() -> [[Int]] {
        var temp_Matrix = matrix
        let currentBlockMatrix = currentBlock.matrix
        for row in 0..<currentBlockMatrix.count {
            for column in 0..<currentBlockMatrix[row].count {
                if currentBlockMatrix[row][column] == 1 {
                    temp_Matrix[row + blockPosition.x][column + blockPosition.y] = 0
                }
            }
        }
        return temp_Matrix
    }

    private func isConflict(_ temp_matrix: [[Int]], newPosition: Coordinates) -> Bool {
        let currentBlockMatrix = currentBlock.matrix
        let blockHeight = currentBlockMatrix.count
        let playViewHeight = temp_matrix.count
        guard blockHeight + newPosition.y < playViewHeight else {
            return true
        }

        for row in 0..<currentBlockMatrix.count {
            for column in 0..<currentBlockMatrix[row].count {
                if temp_matrix[row + newPosition.x][column + newPosition.y] == 1 && currentBlockMatrix[row][column] == 1 {
                    return true
                }
            }
        }
        return false
    }

    private func updateBlockPosition(_ temp_matrix: [[Int]], newPosition: Coordinates, block: BlockProtocol) {
        var temp_matrix = temp_matrix
        let currentBlockMatrix = currentBlock.matrix
        for row in 0..<currentBlockMatrix.count {
            for column in 0..<currentBlockMatrix[row].count {
                if currentBlockMatrix[row][column] == 1 {
                    temp_matrix[row + blockPosition.x][column + blockPosition.y] = 1
                }
            }
        }
        self.blockPosition = newPosition
        self.matrix = temp_matrix
    }
}
