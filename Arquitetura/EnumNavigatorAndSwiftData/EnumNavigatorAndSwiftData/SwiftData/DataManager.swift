//
//  DataManager.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

//
//  DataManager.swift
//  ValueTest
//
//  Created by Jairo Júnior on 09/04/24.
//

import Foundation
import SwiftData

@Observable
class DataManager{
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        defer{ self.mocData() }
    }
    
    private func mocData(){

    }
    
    func addGroup(){
        let groupOfMessage = GroupOfMessages()
        modelContext.insert(groupOfMessage)
    }
    
    func deleteGroup(indexSet: IndexSet, groupOfMessages: [GroupOfMessages]){
        for index in indexSet{
            let destination = groupOfMessages[index]
            modelContext.delete(destination)
        }
    }
    
    func addMessage(newMessage: String, groups: GroupOfMessages){
        guard newMessage.isEmpty == false else { return }
        
        let sight = MessagesInGroup(text: newMessage)
        groups.messages?.append(sight)
    }
    
    func deleteMessage(indexSet: IndexSet, groups: GroupOfMessages){
        for index in indexSet{
            if let sight = groups.messages?[index]{
                modelContext.delete(sight)
            }
        }
    }
}

