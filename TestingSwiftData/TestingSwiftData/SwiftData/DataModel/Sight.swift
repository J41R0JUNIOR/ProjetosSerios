//
//  Sight.swift
//  ValueTest
//
//  Created by Jairo Júnior on 15/04/24.
//

import Foundation
import SwiftData

@Model
class Sight{
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var destination: Destination?
}
