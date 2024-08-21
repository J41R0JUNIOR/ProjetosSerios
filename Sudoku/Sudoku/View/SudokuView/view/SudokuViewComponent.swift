//
//  SudokuView.swift
//  Sudoku
//
//  Created by Jairo Júnior on 19/08/24.
//

import SwiftUI
import SwiftData

struct SudokuView: View {
    var selectedMode: GameSelectionMode?
    @Bindable private var viewModel = SudokuViewModel()
    //    @Environment(\.modelContext) var modelContext
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: [SortDescriptor(\GameBoard.mode, order: .reverse)]) var games: [GameBoard] = []
    
    
    var body: some View {
        VStack{
            Text("Mode:\(String(describing: games.first?.mode))")
            VStack(spacing: 0) {
                ForEach(games.first?.grid.indices ?? [].indices , id: \.self) { rowIndex in
                    HStack(spacing: 0) {
                        ForEach(games.first?.grid[rowIndex].indices ?? [].indices, id: \.self) { columnIndex in
                            let number = games.first?.grid[rowIndex][columnIndex]
                            let correctNumber = games.first?.solution[rowIndex][columnIndex]
                            
                            SudokuNumbersComponent(number: number ?? 0, correctNumber: correctNumber ?? 0)
                                .frame(width: UIScreen.main.bounds.width / 9, height: UIScreen.main.bounds.width / 9)
                                .border(Color.blue, width: 0.5)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.model.dataManager = DataManager(modelContext: modelContext)
            
//            if games.isEmpty {
//                Task {
//                    await viewModel.loadGame(mode: selectedMode ?? .medium)
//                }
//            }
        }
    }
    
}

#Preview {
    let modelContent: ModelContainer = .appContainer
    return SudokuView(selectedMode: .medium).modelContainer(modelContent)
}
