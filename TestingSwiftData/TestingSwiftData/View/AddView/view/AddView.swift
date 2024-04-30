//
//  DetailView.swift
//  ValueTest
//
//  Created by Jairo Júnior on 09/04/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var model = AddViewVM()
    @State var dataManager: DataManager?
    
   
//    @State var seconds: Int = 0
//    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            TextField("Digita ai FF", text: $model.modelView.text).textFieldStyle(.roundedBorder)
                .onSubmit {
                    dataManager?.addDestination(text: model.modelView.text)
                }
                .padding()
//            Text("\(seconds)")
//                .onReceive(timer) { _ in
//                    seconds += 1
//                }
            
        }
        .onAppear(perform: {
            dataManager = DataManager(modelContext: modelContext)
        })
    }
//    func addSamples(){
//        let sample = Destination(name: model.modelView.text)
//        modelContext.insert(sample)
//        model.modelView.text = ""
//    }
}
