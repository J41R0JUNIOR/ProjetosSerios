//
//  MessagesView.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import SwiftUI
import SwiftData

struct MessagesView: View {
    @Environment(\.modelContext) var modelContext
    @State var dataManager: DataManager?
    @Binding var group:GroupOfMessages
    
    var body: some View {
        VStack{
            List(group.messages ?? [MessagesInGroup()]){message in
                Text(message.text)
            }
            
            Button("add"){
                dataManager?.addMessage(newMessage: "uma", groups: group)
            }
        }.onAppear{
            dataManager = DataManager(modelContext: modelContext)
        }
    }
}

#Preview {
    do{
        let configurtion = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: GroupOfMessages.self, configurations: configurtion)
        
        @State var group = GroupOfMessages(name: "grupo1", details: "saúde", priority: 2)
        
        return MessagesView(group: $group)
            .modelContainer(container)
    }catch{
        fatalError("not possible to acces the container")
    }
}
