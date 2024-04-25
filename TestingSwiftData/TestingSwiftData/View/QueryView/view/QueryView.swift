//
//  EnterView.swift
//  ValueTest
//
//  Created by Jairo Júnior on 09/04/24.
//

import SwiftUI
import SwiftData

struct QueryView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var model = QueryViewVM()
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse)]) var destinations: [Destination]
    
    

        
    var body: some View {
     
        VStack{
            List{
                ForEach(destinations){ destination in
                    NavigationLink{
                        EditDetinationView(destination: destination)
                    }label: {
                        VStack{
                            Text(destination.name).bold()
                            HStack{
                                Text(destination.date.formatted(date: .numeric, time: .omitted))
                                Spacer()
                                Text(destination.priority.description)
                            }
                        }
                    }
                }.onDelete(perform: { indexSet in
                    deleteIndex(indexSet)
                })
                .foregroundStyle(Color.white)
                .listRowBackground(Color.black)
            }
            .scrollContentBackground(.hidden)
            
        }
        .toolbar(content: {
            Button("add", systemImage: "plus", action: addDestination)
        })
        
    }
    
    init(sort: SortDescriptor<Destination>, searchString: String){
        
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty{
                return true
            }else{
                return $0.name.localizedStandardContains(searchString)
            }
        },sort: [sort])
    }
    
    

    func deleteIndex(_ indexSet: IndexSet){
        for index in indexSet{
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
    
    func addDestination(){
        let destination = Destination()
        modelContext.insert(destination)
//        path = [destination]
    }
}


#Preview {
    let modelContent: ModelContainer = .appContainer
    
    return QueryView(sort: SortDescriptor(\Destination.name), searchString: "").modelContainer(modelContent)
}
