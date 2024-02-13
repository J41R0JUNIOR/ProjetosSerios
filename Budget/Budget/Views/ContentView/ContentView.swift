//
//  ContentView.swift
//  Budget
//
//  Created by Jairo Júnior on 09/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
        
    var body: some View {
        ZStack {
//            WaveComponent(frequency: $viewModel.frequency, strength: $viewModel.strength, phase: $viewModel.phase, speed: $viewModel.speed, min: viewModel.min, max: viewModel.max)
            VStack{
//                GraphicalComponent(value1: $viewModel.value1, value2: $viewModel.value2, value3: $viewModel.value3, h: $viewModel.h)
//                Spacer()
                
              MeshComponent()
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
