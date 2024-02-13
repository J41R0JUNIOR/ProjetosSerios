//
//  DataController.swift
//  Chat
//
//  Created by Jairo Júnior on 31/08/23.
//

import Foundation
import CoreData
import CloudKit
//import SwiftUI

class DataController:ObservableObject{
    let persistentCloudKitContainer : NSPersistentCloudKitContainer
    init(){
        persistentCloudKitContainer = NSPersistentCloudKitContainer(name: "DataModel")
        
        persistentCloudKitContainer.loadPersistentStores{ desc, error in
            if let error = error{
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
        guard let description = persistentCloudKitContainer.persistentStoreDescriptions.first else{
            fatalError("Failed to initialize persistant container")
        }
        
        description.cloudKitContainerOptions?.databaseScope = .public
        description.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        
        persistentCloudKitContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        persistentCloudKitContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    
    func saveData(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved!!!")
        }catch{
            print("We could not save the data...")
        }
    }
    
    func addMensagem(mensagem: String, user:String, context: NSManagedObjectContext){
        let ChatMensagem = Msg(context: context)
        ChatMensagem.mensagem = mensagem
        ChatMensagem.user = user
        ChatMensagem.date = Date()
        ChatMensagem.id = UUID()
        
        saveData(context: context)
    }
    
}
