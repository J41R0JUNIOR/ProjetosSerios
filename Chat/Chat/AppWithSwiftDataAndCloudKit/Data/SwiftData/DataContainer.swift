//
//  File.swift
//  Chat
//
//  Created by Jairo Júnior on 02/11/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Msn{
    @Attribute(.unique) var id: String
    var data: Date
    var mensagem: String
    var user: String
    
    init(mensagem: String, user:String) {
        self.id = UUID().uuidString
        self.data = Date()
        self.mensagem = mensagem
        self.user = user
    }
}
