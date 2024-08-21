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
    
    var frameWidth = (UIScreen.main.bounds.width / 9) * 0.95
    var frameHeight = (UIScreen.main.bounds.width / 9) * 1
    
    var body: some View {
        VStack{
            Text("Mode:\(games.first?.mode ?? "")")
            Spacer()
            
            ZStack{
                Grid3x3View()
                VStack(spacing: 0) {
                    ForEach(games.first?.grid.indices ?? [].indices , id: \.self) { rowIndex in
                        HStack(spacing: 0) {
                            ForEach(games.first?.grid[rowIndex].indices ?? [].indices, id: \.self) { columnIndex in
                                
//                                let number = games.first?.grid[rowIndex][columnIndex]
//                                let correctNumber = games.first?.solution[rowIndex][columnIndex]
                                
                                SudokuNumbersComponent(number: games.first?.grid[rowIndex][columnIndex] ?? 0, correctNumber: games.first?.solution[rowIndex][columnIndex] ?? 0)
                                
                                    .frame(width: frameWidth, height: frameHeight)
                                    .border(Color.primary, width: 0.2)
                            }
                        }
                    }
                }
            }
            
            Spacer()
        }
        .onAppear {
            viewModel.model.dataManager = DataManager(modelContext: modelContext)
        }
    }
    
}

#Preview {
    let modelContent: ModelContainer = .appContainer
    return SudokuView(selectedMode: .medium).modelContainer(modelContent)
}
