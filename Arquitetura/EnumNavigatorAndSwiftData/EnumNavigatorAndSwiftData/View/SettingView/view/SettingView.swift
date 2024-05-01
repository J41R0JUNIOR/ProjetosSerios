//
//  SettingView.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack{
            NavigationModal(.sheet, value: NavigationHomeViewCoordinator.config, data: NavigationHomeViewCoordinator.self) {
                Text("Hello")
            }
        }
     
    }
}

#Preview {
    SettingView()
}
