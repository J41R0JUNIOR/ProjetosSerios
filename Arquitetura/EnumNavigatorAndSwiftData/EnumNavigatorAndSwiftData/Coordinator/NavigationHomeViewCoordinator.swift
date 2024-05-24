//
//  HomeRootCoordinator.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import SwiftUI

enum NavigationHomeViewCoordinator: View{
//    case home
    case group(group: Binding<GroupOfMessages>)
    case config
    
    var body: some View {
        
        switch self {
//        case .home:
//            HomeView()
            
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
//        case .home:
//            hasher.combine("home")
            
//        case let .group(group: group):
//            hasher.combine("group\(group)")
//        case .config:
//            hasher.combine("config")
        
        default: 
            hasher.combine("\(self)")
            
        }
        
        
    }
    
    
//    func hash(into hasher: inout Hasher) {

//        hasher.combine(self.hashValue)
//    }
    
    
    
//    static func == (lhs: NavigationHomeViewCoordinator, rhs: NavigationHomeViewCoordinator) -> Bool {
//        
//        return lhs.hashValue == rhs.hashValue
//    }
    
//    static func == (lhs: NavigationCoordinator, rhs: NavigationCoordinator) -> Bool {
//
//        switch (lhs, rhs){
//        case (.home, .home):
//            return true
//
//        case let (.group(group: group1), .group(group: group2)):
//            return group1.wrappedValue == group2.wrappedValue
//
//        default:
//            return true
//        }
//    }
}
