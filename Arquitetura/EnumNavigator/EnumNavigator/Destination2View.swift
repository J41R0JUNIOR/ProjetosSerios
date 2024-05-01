//
//  Destination2View.swift
//  EnumNavigator
//
//  Created by Jairo Júnior on 25/04/24.
//

import SwiftUI

struct Destination2View: View {
    let title: String
    @Binding var lista: [String]
    var body: some View {
        VStack{
            Text("Hello, \(title)")
            List {
                ForEach(lista, id: \.self){ element in
                    Text(element)
                }
                .onDelete(perform: { indexSet in
                    lista.remove(atOffsets: indexSet)
                })
            }
            
        }.navigationTitle(title)
    }
}

#Preview {

    
    
    @State var a = ["Jairo", "Pereira", "de", "Sousa", "Júnior"]
    return Destination2View(title: "Jairo", lista: $a)
}
