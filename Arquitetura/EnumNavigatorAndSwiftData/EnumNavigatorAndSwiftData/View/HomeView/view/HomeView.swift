//
//  HomeView.swift
//  EnumNavigatorAndSwiftData
//
//  Created by Jairo Júnior on 29/04/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: [SortDescriptor(\GroupOfMessages.priority, order: .reverse)]) var groups: [GroupOfMessages]
    @Bindable var model = HomeViewM()
    
    var body: some View {
        VStack{
            Button("add") {
                model.showAlert = true
            }
            .foregroundStyle(.black)
            .alert("Tem certeza?", isPresented: $model.showAlert) {
                TextField("Nome do grupo", text: $model.newName)
                Button("Cancelar"){
                    model.showAlert = false
                }
                Button("Confirmar") {
                    model.dataManager?.addGroup(name: model.newName)
                    model.newName = ""
                }
            }
            
            List{
                ForEach(groups, id: \.self){group in
                    
                    NavigationLink(value: NavigationHomeViewCoordinator.group(group: .constant(group))){
                        Text(group.name)
                    }
                                        
                    NavigationModal(.sheet, value: NavigationHomeViewCoordinator.group(group: .constant(group)), data: NavigationHomeViewCoordinator.self) {
                        Text(group.name)
                    }
              
            
                }
                .onDelete(perform: { indexSet in
                    model.dataManager?.deleteGroup(indexSet: indexSet, groupOfMessages: groups)
                })
                .foregroundStyle(Color.white)
                .listRowBackground(Color.black)
                
            }
            .scrollContentBackground(.hidden)
        }
        .onAppear{
            model.dataManager = DataManager(modelContext: modelContext)
        }
    }
}

#Preview {
    let modelContent: ModelContainer = .appContainer
    
    return HomeView().modelContainer(modelContent)
}
