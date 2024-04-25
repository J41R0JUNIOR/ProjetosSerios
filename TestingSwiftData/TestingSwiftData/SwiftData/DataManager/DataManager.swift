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
    
    
    
    
}

