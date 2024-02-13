// CloudKitSettings.swift
// Chat
// Created by Jairo Júnior on 09/11/23.

import Foundation
import CloudKit
import UserNotifications
import SwiftUI

struct Message: Hashable{
    let text: String
    let record: CKRecord
}

class CloudKitSettings: ObservableObject {
    @Published var text: String = ""
    @Published var messages: [Message] = []
 

    init() {
        fetchItems()
    }
    

    func addItem() {
        guard !text.isEmpty else { return }
        addItem(text: text)
    }

    func addItem(text: String) {
        print(text)
        let newMessage = CKRecord(recordType: "Messages")
        newMessage["text"] = text
        saveItem(record: newMessage)
    }
    
    func updateItem(message: Message){
        let record = message.record
        record["text"] = "new name"
        saveItem(record: record)
    }
    
    func deleteItem(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let mensagem = messages[index]
        let record = mensagem.record
        
        DispatchQueue.main.async{
            CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { [weak self] returnedRecordId, error in
                self?.messages.remove(at: index)
            }
        }
    }

    func saveItem(record: CKRecord) {
        CKContainer.default().publicCloudDatabase.save(record) {/*[weak self]*/ returnedRecord, returnedError in
            if let error = returnedError {
                print("Error saving record: \(error)")
            } else {
                print("Record saved successfully: \(String(describing: returnedRecord))")
            }
        }
    }

    func fetchItems() {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Messages", predicate: predicate)
        let queryOperation = CKQueryOperation(query: query)

        var returnedValues: [Message] = []
        addOperation(operation: queryOperation)

        queryOperation.recordMatchedBlock = { (returnedRecordId, returnedResult) in
            switch returnedResult {
            case .success(let record):
                guard let text = record["text"] as? String else { return }
                returnedValues.append(Message(text: text, record: record))
            case .failure(let error):
                print("Error \(error)")
            }
        }
        
        queryOperation.queryResultBlock = { [weak self] returnedResult in
            print("Returned results: \(returnedResult)")
            DispatchQueue.main.async {
            self?.messages = returnedValues
            }
        }
    }

    func addOperation(operation: CKDatabaseOperation) {
        CKContainer.default().publicCloudDatabase.add(operation)
    }
}
