//
//  CloudKitUserBootcamp.swift
//  Chat
//
//  Created by Jairo Júnior on 25/08/23.
//

import SwiftUI
import CloudKit

class CloudKitUserBootcampViewModel: ObservableObject{
    @Published var permissionStatus: Bool = false
    @Published var isSignedToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    @Published var email: String = ""
    
    init(){
        getiCloudStatus()
        requestPermission()
        fetchiCloudUserRecordID()
    }
    private func getiCloudStatus(){
        CKContainer.default().accountStatus { returnedStatus, returnedError in
            DispatchQueue.main.async {
                
                switch returnedStatus{
                case .available:
                    self.isSignedToiCloud = true
                    break
                case .noAccount:
                    self.error = CloudKitError.iCloudAccountNotFoud.rawValue
                    break
                case .couldNotDetermine:
                    self.error = CloudKitError.iCloudAccountNotDetermined.rawValue
                    break
                case .restricted:
                    self.error = CloudKitError.iCloudAccountRestricted.rawValue
                    break
                default:
                    self.error = CloudKitError.iCloudAccountUnknown.rawValue
                    break
                }
            }
        }
    }
    
    enum CloudKitError: String, LocalizedError{
        case iCloudAccountNotFoud
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
    }
    
    func requestPermission(){
        CKContainer.default().requestApplicationPermission([.userDiscoverability]) {[weak self] returnedStatus, returnedError in
            DispatchQueue.main.async {
                print("Permission request returned status:", returnedStatus.rawValue)
                if returnedStatus == .granted {
                    print("Permission granted!")
                    self?.permissionStatus = true
                }
                else {
                    print("Permission not granted.")
                }
            }
        }
    }

    func fetchiCloudUserRecordID(){
        CKContainer.default().fetchUserRecordID {[weak self] returnedID, returnedError in
            if let id = returnedID{
                self?.discoveriCloudUser(id: id)
            }
        }
    }
    
//    func discoreyICloudEmail(id: CKRecord.ID){
//        CKUserIdentity
//    }
    
    func discoveriCloudUser(id: CKRecord.ID){
        CKContainer.default().discoverUserIdentity(withUserRecordID: id) {[weak self] returnedIdentity, returnedError in
            DispatchQueue.main.async {
                if let name = returnedIdentity?.nameComponents?.givenName{
                    self?.userName = name
                }
            }
        }
    }
}










struct CloudKitUserBootcamp: View {
    @StateObject private var vm = CloudKitUserBootcampViewModel()
    var body: some View {
//        Text("Is signed in: \(vm.isSignedToiCloud.description)")
//        Text(vm.error)
//        Text("Permission: \(vm.permissionStatus.description)")
        Text("Olá \(vm.userName)!")
    }
}

struct CloudKitUserBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitUserBootcamp()
    }
}
