//
//  MainSudokuView.swift
//  iApi Sudoku
//
//  Created by Jairo Júnior on 20/10/23.
//

import SwiftUI

struct MainSudokuView: View {
    var sudoku: MainSudokuMV
    
    var body: some View {
        VStack(spacing: 0){
            ForEach(sudoku.model.gameGrid, id: \.self) { rowIndex in
                HStack(spacing: 0) {
                    ForEach(rowIndex, id: \.self) { columnIndex in
                        Button("\(columnIndex)"){
                            print(columnIndex)
                        }
                            .frame(width: 42, height: 42)
                            .border(Color.blue, width: 0.5)
                    }
                }
            }
        }
    }
}
