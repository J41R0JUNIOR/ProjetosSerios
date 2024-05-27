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

                Text("Message: \(viewModel.sudoku?.newboard.message ?? "None message")")
                Text("Results: \(viewModel.sudoku?.newboard.results ?? 0)")
                Text("Dificuldade: \(viewModel.sudoku?.newboard.grids[0].difficulty ?? "nothing")")

                MainSudokuView(sudoku: MainSudokuMV(model: MainSudokuM(gameGrid: viewModel.gameGrid, solutionGrid: $viewModel.solutionGrid)))
            }
        }
        .task {
            await viewModel.newGame()
        }
        .padding()
    }
}
