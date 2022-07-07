//
//  BlockManager.swift
//  Tetris
//
//  Created by Nidhi Jain on 23/06/22.
//
import Combine
import Foundation

class BlocksManager: ObservableObject {
    static let shared = BlocksManager()
    
    @Published var nextBlock: BlockProtocol
    
    private var currentBlock: BlockProtocol
    private let blockGenerator: BlockGeneratable
    
    private init(blockGenerator: BlockGeneratable = BlockGenerator()) {
        self.blockGenerator = blockGenerator
        self.currentBlock = blockGenerator.getNext()
        self.nextBlock = blockGenerator.getNext()
    }
    
    /// Gets block to be dropped in playview
    /// - Returns: block
    func pop() -> BlockProtocol {
        currentBlock = nextBlock
        nextBlock = blockGenerator.getNext()
        return currentBlock
    }

}

protocol BlockGeneratable {
    func getNext() -> BlockProtocol
}

struct BlockGenerator: BlockGeneratable {
    func getNext() -> BlockProtocol {
        return getRandomBlock()
    }
    
    private func getRandomBlock() -> (BlockProtocol) {
        let numberOfRotations = Int.random(in: 0...3)
        let block = BlockShape.allCases.randomElement()!.block
        (0...numberOfRotations).forEach { _ in
            block.rotateMatrix()
        }
        return block
    }
}
