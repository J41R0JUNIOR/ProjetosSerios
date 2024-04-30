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
    
    @State var dataManager: DataManager?
    
    

        
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
                    dataManager?.DeleteDestination(indexSet: indexSet, destinations: destinations)
                })
                .foregroundStyle(Color.white)
                .listRowBackground(Color.black)
            }
            .scrollContentBackground(.hidden)
            
        }
        .onAppear(perform: {
            dataManager = DataManager(modelContext: modelContext)
        })
        .toolbar(content: {
         
            Button{
                dataManager?.addDestination()
            }label: {
                Image(systemName: "plus")
            }
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
    
    

//    func deleteIndex(_ indexSet: IndexSet){
//        for index in indexSet{
//            let destination = destinations[index]
//            modelContext.delete(destination)
//        }
//    }
//    
//    func addDestination(){
//        let destination = Destination()
//        modelContext.insert(destination)
////        path = [destination]
//    }
}


#Preview {
    let modelContent: ModelContainer = .appContainer
    
    return QueryView(sort: SortDescriptor(\Destination.name), searchString: "").modelContainer(modelContent)
    
}
