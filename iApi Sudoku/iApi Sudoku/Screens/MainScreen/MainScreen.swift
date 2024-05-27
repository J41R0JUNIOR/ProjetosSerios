//
//  MainScreen.swift
//  iApi Sudoku
//
//  Created by Jairo Júnior on 20/10/23.
//

import SwiftUI

struct MainScreen: View {
    @Environment(\.managedObjectContext) var managedObjContext

    var body: some View {
        TabView{
            HomeScreen()
            .tabItem {
                Label("Home", systemImage: "house")
            }
        }
    }
}


