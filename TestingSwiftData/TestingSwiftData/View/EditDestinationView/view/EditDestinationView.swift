//
//  EditDetinationView.swift
//  ValueTest
//
//  Created by Jairo Júnior on 10/04/24.
//

import SwiftUI
import SwiftData

struct EditDetinationView: View {
    @Bindable var destination: Destination
    @Environment(\.modelContext) var modelContext
    @State var dataManager: DataManager?

    
    @State var newSightName = ""
    
    var body: some View {
        VStack{
        Form{
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            
            Section("Priority"){
                Picker("Priority", selection: $destination.priority, content: {
                    Text("Not mutch").tag(1)
                    Text("Meh").tag(2)
                    Text("Must").tag(3)
                })
                .pickerStyle(.segmented)
                .navigationBarTitleDisplayMode(.inline)
            }
            HStack{
                TextField("Name of Sight", text: $newSightName)
                    .onSubmit() {dataManager?.addSight(newSightName: newSightName, destination: destination)}
                
                Button("Add") {
                    dataManager?.addSight(newSightName: newSightName, destination: destination)
                }
            }
            Section {
                if let wrappedSight = destination.sights{
                    ForEach(wrappedSight) {sight in
                        Text(sight.name)
                    }
                    .onDelete(perform: { indexSet in
                        dataManager?.deleteSight(indexSet: indexSet, destination: destination)
                    })
                }
            }
        }
        }.onAppear(perform: {
            dataManager = DataManager(modelContext: modelContext)
        })
        .navigationTitle("Edit Destination")
    }
}

#Preview {
    do{
        let configurtion = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: configurtion)
        let example = Destination(name: "name", details: "details", date: .now, priority: 2)
        
        return EditDetinationView(destination: example)
            .modelContainer(container)
    }catch{
        fatalError("not possible to acces the container")
    }
}
