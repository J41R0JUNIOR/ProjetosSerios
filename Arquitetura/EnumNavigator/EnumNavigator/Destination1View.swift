//
//  Destination1View.swift
//  EnumNavigator
//
//  Created by Jairo Júnior on 25/04/24.
//

import SwiftUI

struct Destination1View: View {
    @State var a = ["a", "c"]
    var body: some View {
        List {
            NavigationLink(value: Root1NavigationLinkValues.destination2(title: "Jairo", lista: $a)) {
                Text("Destination2View")
            }
        }.navigationTitle("Destintion1View")
    }
}

#Preview {
    Destination1View()
}
