import Foundation

protocol BlockProtocol {
    var matrix: [[Int]] { get }
    func rotateMatrix()
}

enum BlockShape: CaseIterable  {
    case L, Z, Box, Line, T
    
    var block: BlockProtocol {
        switch self {
        case .L:
                return LBlock()
        case .Z:
            return ZBlock()
        case .Box:
            return BoxBlock()
        case .Line:
            return LineBlock()
        case .T:
            return TBlock()
        }
    }
}

class LBlock: BlockProtocol{
    var matrix: [[Int]] = [ [1, 0],
                            [1, 0],
                            [1, 1]]
    
    func rotateMatrix() {}
}

class ZBlock: BlockProtocol{
    var matrix: [[Int]] = [[1,1,0],
                           [0,1,1]]
    
    func rotateMatrix() {}
}

class BoxBlock: BlockProtocol{
    var matrix: [[Int]] = [[1, 1],
                           [1, 1]]
    
    func rotateMatrix() {}
}

class LineBlock: BlockProtocol{
    var matrix: [[Int]] = [[1],
                           [1],
                           [1]]
    
    func rotateMatrix() {}
}

class TBlock: BlockProtocol{
    var matrix: [[Int]] = [[1,1,1],
                           [0,1,0]]
    
    func rotateMatrix() {}
}

