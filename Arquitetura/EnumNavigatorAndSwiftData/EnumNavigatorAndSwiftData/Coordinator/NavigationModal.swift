//
//  NavigationModal.swift
//  EnumNavigator
//
//  Created by Jairo Júnior on 26/04/24.
//

import SwiftUI
import SwiftData

enum NavigationModalType {
    case sheet, fullScreenCover
}

struct NavigationModal<Value: View, Label: View, D: Hashable & View>: View {
    
    @State private var isPresented = false
    
    var type: NavigationModalType
    var value: Value
    let data: D.Type
    var presentationDetents: Set<PresentationDetent>?  // Adicione esta propriedade
    var onDismiss: (() -> Void)?
    @ViewBuilder var label: () -> Label
    
    init(_ type: NavigationModalType,
         value: Value,
         data: D.Type,
         presentationDetents: Set<PresentationDetent>? = nil,  // Adicione esta propriedade
         onDismiss: (() -> Void)? = nil,
         @ViewBuilder label: @escaping () -> Label) {
        self.type = type
        self.value = value
        self.data = data
        self.presentationDetents = presentationDetents
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
                .sheet(isPresented: $isPresented, onDismiss: onDismiss) {
                    NavigationStack {
                        value
                            .navigationLinkValues(data)
                    }
                    .presentationDetents(presentationDetents ?? [])  // Aplica os detents
                }
        }
        .if(type == .fullScreenCover) { view in
            view
                .fullScreenCover(isPresented: $isPresented, onDismiss: onDismiss) {
                    NavigationStack {
                        value
                            .navigationLinkValues(data)
                    }
                }
        }
    }
}
