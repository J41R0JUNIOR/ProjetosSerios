//
//  EnumNavigatorAndSwiftDataApp.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import SwiftUI

@main
struct EnumNavigatorAndSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: GroupOfMessages.self)
    }
}
