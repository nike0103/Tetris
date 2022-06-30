import Foundation

enum DirectionEnum {
    case up, down, left, right
}

enum BlockShape: CaseIterable {
    case L, Z, Box, I, T
}

protocol BlockProtocol {
    var matrix: [[Int]] { get }
    func rotateMatrix(direction: DirectionEnum)
}

class LBlock: BlockProtocol{
    var matrix: [[Int]] = [ [1, 0],
                            [1, 0],
                            [1, 1]]
    
    func rotateMatrix(direction: DirectionEnum) {}
}

class ZBlock: BlockProtocol{
    var matrix: [[Int]] = [[1,1,0],
                           [0,1,0],
                           [0,1,1]]
    
    func rotateMatrix(direction: DirectionEnum) {}
}

class BoxBlock: BlockProtocol{
    var matrix: [[Int]] = [[1, 1],
                           [1, 1]]
    
    func rotateMatrix(direction: DirectionEnum) {}
}

class IBlock: BlockProtocol{
    var matrix: [[Int]] = [[0, 1],
                           [0, 1],
                           [0, 1],
                           [0, 1]]
    
    func rotateMatrix(direction: DirectionEnum) {}
}

class TBlock: BlockProtocol{
    var matrix: [[Int]] = [[1,1,1],
                           [0,1,0],
                           [0,1,0]]
    
    func rotateMatrix(direction: DirectionEnum) {}
}

class BlocksManager {
    
    static let shared = BlocksManager()
    var currentBlock: BlockProtocol?
    var nextBlock: BlockProtocol?
    
    private init(){}
    
    func getBlocks(type: BlockShape)-> BlockProtocol {
        switch type {
        case .L:
            return LBlock()
        case .Z:
            return ZBlock()
        case .Box:
            return BoxBlock()
        case .I:
            return IBlock()
        case .T:
            return TBlock()
        }
    }
    
    func getRandomBlocks() -> (BlockProtocol?, BlockProtocol?) {
        //Will return block of random shape like L, Z, Box, I, T
        let randomNo = Int.random(in: 0 ..< BlockShape.allCases.count)
        self.currentBlock = nextBlock
        self.nextBlock = getBlocks(type: BlockShape.allCases[randomNo])
        print("CurrentBlock is \(currentBlock)")
        print("NextBlock is \(nextBlock)")
        return (currentBlock, nextBlock)
    }
}
print(BlocksManager.shared.getRandomBlocks())


class Sample{
    
    static let shared = Sample()

    var nameStr = "Nidhi"
    
    func updateName(name: String){
        print(nameStr)
        nameStr = name
        print(nameStr)
    }
}

Sample.shared.updateName(name: "Ac")
