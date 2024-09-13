import UIKit

//
//struct SudokuGenerator{
//    let size = 9
//    var gameArray:[[Int]]
// 
//    mutating func createRows(){
//        for n in 0...size{
//            gameArray.append([0,0,0,0,0,0,0,0,0])
//        }
//    }
//    
//    func fillGrid(grid: [[Int]]){
//        
//    }
//}

func findNumberInBox(number: Int, i: Int, j: Int) {
    let convertedI = Int(ceil(Double(i) / 3.0))
    let convertedJ = Int(ceil(Double(j) / 3.0))
}
findNumberInBox(number: 3, i: 2, j: 5)
