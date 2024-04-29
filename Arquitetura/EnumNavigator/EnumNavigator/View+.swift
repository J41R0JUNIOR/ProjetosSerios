//
//  View+.swift
//  EnumNavigator
//
//  Created by Jairo Júnior on 26/04/24.
//

import SwiftUI

extension View {
    func navigationLinkValues<D>(_ data: D.Type) -> some View where D: Hashable & View{
        NavigationStack{
            Root1View().navigationDestination(for: Root1NavigationLinkValues.self, destination: { $0 })
        }
    }
    
    @ViewBuilder
    func `if` <Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        }else{
            self
        }
    }
}
