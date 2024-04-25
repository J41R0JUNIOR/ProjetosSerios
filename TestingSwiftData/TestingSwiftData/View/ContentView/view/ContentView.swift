//
//  ContentView.swift
//  ValueTest
//
//  Created by Jairo Júnior on 04/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var model = ContentViewVM()
    @State var sortOrder = SortDescriptor(\Destination.name)
    @State var searchString = ""


    var body: some View {
        NavigationStack{
            TabView{
                AddView()
                    .tabItem {
                        Label("Home", systemImage: "plus" )
                    }
                QueryView(sort: sortOrder, searchString: searchString)
                
                    .searchable(text: $searchString)
                    .tabItem {
                        Label("List", systemImage: "list.bullet" )
                    }
                    .toolbar {
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort", selection: $sortOrder){
                                Text("Name")
                                    .tag(SortDescriptor(\Destination.name))
                                Text("Priority")
                                    .tag(SortDescriptor(\Destination.priority, order: .reverse))
                                Text("Date")
                                    .tag(SortDescriptor(\Destination.date))
                            }
                            .pickerStyle(.inline)
                        }
                    }
            }
        }
    }
}


#Preview {
    //    ContentView()
    let modelContent: ModelContainer = .appContainer
    return ContentView().modelContainer(modelContent)
    
    
  
}

