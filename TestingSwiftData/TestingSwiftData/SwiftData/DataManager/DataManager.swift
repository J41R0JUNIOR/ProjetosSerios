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
//        defer{ self.mocData() }
    }
    
//    private func mocData(){
//
//    }
    
//    func deleteIndex(_ indexSet: IndexSet){
//        for index in indexSet{
//            let destination = destinations[index]
//            modelContext.delete(destination)
//        }
//    }
    

    
    func addDestination(){
        let destination = Destination()
        modelContext.insert(destination)
//        path = [destination]
    }
    
    func addDestination(text: String){
        let sample = Destination(name: text)
        modelContext.insert(sample)
    }
    
    func DeleteDestination(indexSet: IndexSet, destinations: [Destination]){
        for index in indexSet{
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
    
    func addSight(newSightName: String, destination: Destination){
        guard newSightName.isEmpty == false else { return }
        
        let sight = Sight(name: newSightName)
        destination.sights?.append(sight)
    }
    
    func deleteSight(indexSet: IndexSet, destination: Destination){
        for index in indexSet{
            if let sight = destination.sights?[index]{
                modelContext.delete(sight)
            }
        }
    }
}

