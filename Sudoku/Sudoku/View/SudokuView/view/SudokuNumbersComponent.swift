//
//  SudokuNumbersComponent.swift
//  Sudoku
//
//  Created by Jairo Júnior on 20/08/24.
//

import SwiftUI

struct SudokuNumbersComponent: View {
    @State var number: Int = 0
    @State var correctNumber: Int = 0
    
    
    var body: some View {
        VStack{
            if number == correctNumber{
                Text("\(number)").foregroundStyle(.primary)
            }else if number == 0{
                NavigationModal(.sheet, value: NavigationContentViewCoordinator.sudokuNumbers(number: $number), data: NavigationContentViewCoordinator.self, presentationDetents: [.fraction(0.1)], label: {
                    Text(" ")
                }, asyncFunction: {})
            }else{
//                Text("\(number ?? 0)").foregroundStyle(.red)
                NavigationModal(.sheet, value: NavigationContentViewCoordinator.sudokuNumbers(number: $number), data: NavigationContentViewCoordinator.self, presentationDetents: [.fraction(0.1)], label: {
                    Text("\(number)").foregroundStyle(.red)
                }, asyncFunction: {})
            }
        }
    }
}

#Preview {
    SudokuNumbersComponent(number: 5, correctNumber: 4)
}
