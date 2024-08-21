//
//  HomeView.swift
//  Sudoku
//
//  Created by Jairo Júnior on 20/08/24.
//

import SwiftUI
struct HomeView: View {
    @State var choice: GameSelectionMode = .medium
    @State var hasChosen = false
    
    var body: some View {
        VStack{
            switch hasChosen{
            case false:
                NavigationModal(.sheet, value: NavigationContentViewCoordinator.homeSelectionMode(selectedMode: $choice, hasChosen: $hasChosen), data: NavigationContentViewCoordinator.self, presentationDetents: [.fraction(0.3)]) {
                    Text("Create Game")
                } asyncFunction: {}
                
            case true:
                NavigationModal(.sheet, value: NavigationContentViewCoordinator.homeSelectionMode(selectedMode: $choice, hasChosen: $hasChosen), data: NavigationContentViewCoordinator.self, presentationDetents: [.fraction(0.3)]) {
                    Text("Create Game")
                } asyncFunction: {}
                
                NavigationLink(value: NavigationContentViewCoordinator.sudoku(selectedMode: choice)) {
                    Text("Start")
                }
            }
           

        }.buttonStyle(.borderedProminent)
            .onAppear(perform: {
                hasChosen = false
            })
            

    }
}

#Preview {
    HomeView().navigationLinkValues(NavigationContentViewCoordinator.self)
}
