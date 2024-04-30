//
//  Destination.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import Foundation
import SwiftData

@Model
class GroupOfMessages{
    var name: String
    var details: String
    var priority: Int
    @Relationship(deleteRule: .cascade) var messages : [MessagesInGroup]?

    
    init(name: String = "No name", details: String = "", priority: Int = 0) {
        self.name = name
        self.details = details
        self.priority = priority
    }
}
