//
//  Sight.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import Foundation
import SwiftData

@Model
class MessagesInGroup{
    var text: String
    var date: Date
    
    init(text: String = "", date: Date = .now) {
        self.text = text
        self.date = date
    }
    
    var destination: GroupOfMessages?
}
