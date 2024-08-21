//
//  HomeRootCoordinator.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import SwiftUI

enum NavigationHomeViewCoordinator: View{
    case home
    case group(group: Binding<GroupOfMessages>)
    case config
    
    var body: some View {
        
        switch self {
                    case .home:
                        HomeView()
            
        case .group(let group):
            MessagesView(group: group)
        case .config:
            SettingView()
        }
    }
}


extension NavigationHomeViewCoordinator: Equatable, Hashable{
    static func == (lhs: NavigationHomeViewCoordinator, rhs: NavigationHomeViewCoordinator) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        
        switch self {
        default:
            hasher.combine("\(self)")
        }
    }
}

