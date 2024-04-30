//
//  EnumCoordinator.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import SwiftUI

enum HomeRootNavigator: View{

    case home
    case setting
    
    var body: some View {
        
        switch self {
        case .home:
            HomeView()
            
        case .setting:
            SettingView()
        }
    }
}

extension HomeRootNavigator: Equatable, Hashable{

    func hash(into hasher: inout Hasher) {
        
        switch self {
        case .destination1:
            hasher.combine("destination1")
            
        case let .destination2(title, lista):
            hasher.combine("destination2\(title)\(lista.wrappedValue)")
        }
    }
    
    static func == (lhs: HomeRootNavigator, rhs: HomeRootNavigator) -> Bool {

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
