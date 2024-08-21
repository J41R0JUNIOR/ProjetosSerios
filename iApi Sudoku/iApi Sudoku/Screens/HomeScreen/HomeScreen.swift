//
//  ContentView.swift
//  iApi Sudoku
//
//  Created by Jairo Júnior on 18/08/23.
//

import SwiftUI


struct HomeScreen: View {
    @StateObject private var viewModel = HomeScreenMV()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Button {
                    Task {
                        await viewModel.newGame()
                    }
                } label: {
                    Text("Generate")
                }.buttonStyle(.borderedProminent)

                Text("Message: \(viewModel.sudoku?.info ?? "None message")")
//                Text("Results: \(viewModel.sudoku?.newboard. ?? 0)")
//                Text("Dificuldade: \(viewModel.sudoku?.newboard. ?? "nothing")")
 
                MainSudokuView(sudoku: MainSudokuMV(model: MainSudokuM(gameGrid: viewModel.gameGrid, solutionGrid: $viewModel.solutionGrid)))
            }
        }
        .task {
            await viewModel.newGame()
        }
        .padding()
    }
}
