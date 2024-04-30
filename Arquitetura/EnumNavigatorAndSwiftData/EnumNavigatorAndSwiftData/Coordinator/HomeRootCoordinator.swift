//
//  HomeRootCoordinator.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import SwiftUI

enum HomeRootNavigator: View{

    case home
    case group(group: Binding<GroupOfMessages>)
    
    var body: some View {
        
        switch self {
        case .home:
            HomeView()
            
        case .group(let group):
            MessagesView(group: group)
        }
    }
}

extension HomeRootNavigator: Equatable, Hashable{

    func hash(into hasher: inout Hasher) {

        switch self {
        case .home:
            hasher.combine("home")

        case let .group(group: group):
            hasher.combine("group\(group)")
        }
    }

    static func == (lhs: HomeRootNavigator, rhs: HomeRootNavigator) -> Bool {

        switch (lhs, rhs){
        case (.home, .home):
            return true

        case let (.group(group: group1), .group(group: group2)):
            return group1.wrappedValue == group2.wrappedValue

        default:
            return true
        }
    }
}
