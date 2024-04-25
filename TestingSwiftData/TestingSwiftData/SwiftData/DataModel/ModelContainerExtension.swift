//
//  ModelContainer.swift
//  ValueTest
//
//  Created by Jairo Júnior on 09/04/24.
//

import Foundation
import SwiftData

extension ModelContainer{
    static let appContainer: ModelContainer = {
        do{
            let container = try ModelContainer(for: Destination.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
            return container
        }catch{
            fatalError("Failed to create appcontainer")
        }
    }()
}
