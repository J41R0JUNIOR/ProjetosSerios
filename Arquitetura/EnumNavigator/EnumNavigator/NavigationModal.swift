//
//  NavigationModal.swift
//  EnumNavigator
//
//  Created by Jairo Júnior on 26/04/24.
//

import SwiftUI

enum NavigationModalType {
    case sheet, fullScreenCover
}

struct NavigationModal<Value:View, Label: View, D: Hashable & View>: View {
    
    @State private var isPresented = false
    
    var type: NavigationModalType
    var value: Value
    let data: D.Type
    var onDismiss: (()->Void)?
    @ViewBuilder var label: () -> Label
    
    init(_ type: NavigationModalType, value: Value, data: D.Type, onDismiss: (() -> Void)? = nil, @ViewBuilder label: @escaping () -> Label) {
        self.type = type
        self.value = value
        self.data = data
        self.onDismiss = onDismiss
        self.label = label
    }
    
    var body: some View {
        
        Button(action: {
            isPresented.toggle()
        }, label: {
            label()
        })
        .if(type == .sheet) { view in
            view
                .sheet(isPresented: $isPresented, onDismiss: onDismiss, content: {
                    NavigationStack{
                        value
                            .navigationLinkValues(data)
                    }
                })
        }
        .if(type == .fullScreenCover) { view in
            view
                .fullScreenCover(isPresented: $isPresented, onDismiss: onDismiss, content: {
                    NavigationStack{
                        value
                            .navigationLinkValues(data)
                    }
                })
        }
    }
}


