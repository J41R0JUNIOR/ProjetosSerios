//
//  Root1View.swift
//  EnumNavigator
//
//  Created by Jairo Júnior on 25/04/24.
//

import SwiftUI

struct Root1View: View {
    @State var a = ["a", " "]

    var body: some View {
        List {
            NavigationLink(value: Root1NavigationLinkValues.destination1) {
                Text("Destination1View")
            }
            NavigationLink(value: Root1NavigationLinkValues.destination2(title: "Destination2", lista: $a)) {
                Text("Destination2View")
            }
     
                NavigationModal(.sheet, value: Root1NavigationLinkValues.destination1, data: Root1NavigationLinkValues.self) {
                    Text("DestinationModal1")
                    
                }
            
//
            NavigationModal(.fullScreenCover, value: Root1NavigationLinkValues.destination2(title: "", lista: $a), data: Root1NavigationLinkValues.self) {
                print("Dismissed")
            } label: {
                Text("Destination1FullScreenCover")
            }

            
            
        }.navigationTitle("Root1View")
        
        
        
        
//        List {
//            ForEach(destinations, id: \.self){ destino in
//                NavigationLink(value: destino) {
//                    Text("\(destino)")
//                }
//            }
//        }
        
    }
}

#Preview {
    Root1View()
}
