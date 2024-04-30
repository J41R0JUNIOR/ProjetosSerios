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
    
    @State var dataManager: DataManager?
    var body: some View {
        VStack{
            Button("add") {
                dataManager?.addGroup()
            }
            
            List{
                ForEach(groups, id: \.self){group in
                    
                    NavigationLink(value: HomeRootNavigator.group(group: <#T##Binding<GroupOfMessages>#>)) {
                        Text(group.name)
                    }
                    
                }.onDelete(perform: { indexSet in
                    dataManager?.deleteGroup(indexSet: indexSet, groupOfMessages: groups)
                })
                .foregroundStyle(Color.white)
                    .listRowBackground(Color.black)
                
            } .scrollContentBackground(.hidden)
        }.onAppear{
            dataManager = DataManager(modelContext: modelContext)
        }
    }
}

#Preview {
    let modelContent: ModelContainer = .appContainer
    
    return HomeView().modelContainer(modelContent)
}
