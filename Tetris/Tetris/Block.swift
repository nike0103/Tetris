import Foundation

enum DirectionEnum {
    case up, down, left, right
}

enum BlockShape {
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
    
    func rotateMatrix(direction: DirectionEnum) {
        
    }
}

class BlocksGenerator {
    
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
    
    func getRandomBlocks(shape: BlockShape) {
        //Will return block of random shape like L, Z, Box, I, T
    }
}
