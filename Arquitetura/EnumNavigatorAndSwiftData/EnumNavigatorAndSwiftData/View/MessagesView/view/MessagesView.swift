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
    @State var message = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        VStack{
            List{
                ForEach(group.messages ?? [MessagesInGroup()]){message in
                    Text(message.text)
                }
                .foregroundStyle(Color.white)
                .listRowBackground(Color.black)
            }
            .scrollContentBackground(.hidden)
            
            HStack{
                TextField("Digitar mensagem", text: $message)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    dataManager?.addMessage(newMessage: message, groups: group)
                    message = ""
                }, label: {
                    Image(systemName: "paperplane.circle.fill").foregroundStyle(.black)
                    
                })
            }  .padding()
        }
        .toolbar{
            
            ToolbarItem(placement: .topBarLeading) {
                Button("Back", action: {
                    self.presentationMode.wrappedValue.dismiss()
                }).foregroundStyle(.black)
            }
            
//            Button("Back", action: {
//                self.presentationMode.wrappedValue.dismiss()
//            }).foregroundStyle(.black)
            
            
        }
        
        .onAppear{
            dataManager = DataManager(modelContext: modelContext)
        }
        .navigationTitle(group.name)
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
