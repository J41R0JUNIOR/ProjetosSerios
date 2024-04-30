//
//  ContentView.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    var body: some View {
        TabView {
            HomeView()
                .navigationLinkValues(HomeRootNavigator.self)
            .tabItem {
                Image(systemName: "house")
            }
            SettingView()
            .tabItem {
                Image(systemName: "gear")
            }
        }
    }
}

#Preview {
    let modelContent: ModelContainer = .appContainer

    return ContentView().modelContainer(modelContent)
}
