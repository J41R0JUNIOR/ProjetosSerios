//
//  SudokuView.swift
//  Sudoku
//
//  Created by Jairo Júnior on 19/08/24.
//

import SwiftUI

struct SudokuView: View {
    var selectedMode: GameSelectionMode
    @Bindable private var viewModel = SudokuViewModel()
    
    var body: some View {
        VStack{
            Text("Mode:\(selectedMode)")
            VStack(spacing: 0) {
                ForEach(viewModel.model.grid.indices, id: \.self) { rowIndex in
                    HStack(spacing: 0) {
                        ForEach(viewModel.model.grid[rowIndex].indices, id: \.self) { columnIndex in
                            let number = viewModel.model.grid[rowIndex][columnIndex]
                            let correctNumber = viewModel.model.solution[rowIndex][columnIndex]
                            
                            SudokuNumbersComponent(number: number, correctNumber: correctNumber)
                                .frame(width: UIScreen.main.bounds.width / 9, height: UIScreen.main.bounds.width / 9)
                            
                                .border(Color.blue, width: 0.5)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.loadGame(mode: selectedMode)
            }
        }
    }
}

#Preview {
    SudokuView(selectedMode: .medium)
}
