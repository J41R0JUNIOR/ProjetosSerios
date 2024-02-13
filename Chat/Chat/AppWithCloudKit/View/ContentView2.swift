//
//  ContentView2.swift
//  Chat
//
//  Created by Jairo Júnior on 09/11/23.
//

import SwiftUI
import CloudKit


struct ContentView2: View {
    @StateObject var ck = CloudKitSettings()
    @StateObject var notifications = PushNotificationCloudKit()
    
    var body: some View {
        VStack{
            HStack{
                HStack{
//                    Button("Request"){
//                        not.requestNotificationPermission()
//                    }
//                    .buttonStyle(.borderedProminent)
//                    Button("Subscribe"){
//                        not.subscribeToNotifications()
//                    }
//                    .buttonStyle(.borderedProminent)
//                    Button("Ubsubscribe"){
//                        not.unSubscribeToNotifications()
//                    }
//                    .buttonStyle(.borderedProminent)
                }
            }
            Divider()
            List{
                ForEach(ck.messages, id: \.self){item in
                    Text(item.text)
                        .onTapGesture {
                            ck.updateItem(message: item)
                        }
                }.onDelete(perform:ck.deleteItem)
            }.listStyle(.plain)
            Divider()
            Spacer()
            TextField("Add message", text: $ck.text)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    ck.addItem()
                    ck.text = ""
            }
        }.padding()
        
    }
}

#Preview {
    ContentView2()
}
