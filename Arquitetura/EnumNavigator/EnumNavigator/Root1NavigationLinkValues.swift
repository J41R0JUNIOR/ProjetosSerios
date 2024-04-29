//
//  Root1NavigationLinkValues.swift
//  EnumNavigator
//
//  Created by Jairo Júnior on 25/04/24.
//

import SwiftUI


enum Root1NavigationLinkValues: View{
    
    
    
    case destination1
    case destination2(title: String, lista: Binding<[String]>)
//    case destination3(title: String, lista: Binding<[String]>)
    
    var body: some View {
        switch self {
        case .destination1:
            Destination1View()
        case .destination2(let title, let lista):
            
            Destination2View(title: title, lista: lista)
            
//        case .destination3(let title, let lista):
//            Destination2View(title: title, lista: lista)
            
        }
    
    }
}

extension Root1NavigationLinkValues: Equatable, Hashable{

    func hash(into hasher: inout Hasher) {
        switch self {
        case .destination1:
            hasher.combine("destination1")
        case let .destination2(title, lista):
            hasher.combine("destination2\(title)\(lista.wrappedValue)")
//        case
            
        }
    }
    
    static func == (lhs: Root1NavigationLinkValues, rhs: Root1NavigationLinkValues) -> Bool {

        switch (lhs, rhs){
        case (.destination1, .destination1):
            return true
        case let (.destination2(title: title1, lista: lista1), .destination2(title: title2, lista: lista2)):
            return title1 == title2 && lista1.wrappedValue == lista2.wrappedValue
        default:
            return true
        }
    }
}
