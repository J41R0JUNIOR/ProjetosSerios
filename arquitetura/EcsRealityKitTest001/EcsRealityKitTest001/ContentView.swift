//
//  ContentView.swift
//  EcsRealityKitTest001
//
//  Created by Jairo Júnior on 12/09/24.
//

import SwiftUI
import GameplayKit

struct ContentView: View {
    @Bindable var cubeEntity = CubeEntity()
    @State var colorSystem: ChangeColorSystem?
    
    var body: some View {
        VStack {
            
            Circle()
                .foregroundColor(cubeEntity.colorComponent.uiColor)
                .frame(width: 100, height: 100)
                .onAppear {
                    setupSystem()
                    updateColor()
                }
        }
        .padding()
    }
    
    func setupSystem() {
        let system = ChangeColorSystem(entities: [cubeEntity])
        self.colorSystem = system
    }
    
    func updateColor() {
        colorSystem?.update()
    }
}

#Preview {
    ContentView()
}

