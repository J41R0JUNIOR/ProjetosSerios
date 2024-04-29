//
//  ContentView.swift
//  EnumNavigator
//
//  Created by Jairo Júnior on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Root1View()
                .navigationLinkValues(Root1NavigationLinkValues.self)
                .tabItem {
                    Image(systemName: "1.circle")
                }
            Root2View()
                .tabItem { Image(systemName: "2.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
