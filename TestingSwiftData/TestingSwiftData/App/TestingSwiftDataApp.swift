//
//  TestingSwiftDataApp.swift
//  TestingSwiftData
//
//  Created by Jairo Júnior on 24/04/24.
//

import SwiftUI

@main
struct TestingSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Destination.self)
    }
}
