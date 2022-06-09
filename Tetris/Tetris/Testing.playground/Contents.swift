import UIKit

var greeting = "Hello, playground"

class LBlock {
    var matrix: [[Int]] = [[0,0], [0,1] , [1,1], [2,1], [2,2]]
    func printShape() {
        
        for (i, _) in matrix.enumerated() {
            var newVal = ""
            for (_, value) in matrix[i].enumerated() {
                if value == 0 {
                    newVal = newVal + ""
                } else {
                    newVal = newVal + "\(value)"
                }
            }
            if !newVal.isEmpty {
                print(newVal)
            }
        }
    }
    
    func printZShape() {
        
        for i in 0...3 {
            for j in 0...3 {
               
            }
        }
            
    }
}


let obj = LBlock()
obj.printShape()
