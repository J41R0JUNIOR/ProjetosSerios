//
//  ContentView.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import SwiftUI
import SwiftData
import CoreMotion


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Image(systemName: "house")
            }
            
            SettingView()
            .tabItem {
                Image(systemName: "gear")
            }
        }.navigationLinkValues(NavigationHomeViewCoordinator.self)
    }
}

#Preview {
    let modelContent: ModelContainer = .appContainer

    return ContentView().modelContainer(modelContent)
}
