//
//  SudokuViewModel.swift
//  Sudoku
//
//  Created by Jairo Júnior on 20/08/24.
//

import Foundation

@Observable
class SudokuViewModel{
    var model = SudokuModel()
    
 
        func loadGame(mode: GameSelectionMode) async {
            do {
                 await model.apiCall.newGame(mode: mode)
                model.grid = model.apiCall.gameGrid
                model.solution = model.apiCall.solutionGrid
            }
    
    }

}
