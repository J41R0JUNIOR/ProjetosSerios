//
//  SelectionGameMode.swift
//  Sudoku
//
//  Created by Jairo Júnior on 20/08/24.
//

import SwiftUI

struct HomeSelectionMode: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var selectedMode: GameSelectionMode
    @Binding var hasChosen: Bool
    
    var body: some View {
        VStack{

            Button(action: {
                selectedMode = .easy
                hasChosen = true
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Easy").frame(width: UIScreen.main.bounds.width * 0.7)
            })
            
            Button(action: {
                selectedMode = .medium
                hasChosen = true

                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Medium").frame(width: UIScreen.main.bounds.width * 0.8)
            })
            
            Button(action: {
                selectedMode = .hard
                hasChosen = true

                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Hard").frame(width: UIScreen.main.bounds.width * 0.7)
            })
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    HomeSelectionMode( selectedMode: .constant(.hard), hasChosen: .constant(false)).navigationLinkValues(NavigationContentViewCoordinator.self)
}
