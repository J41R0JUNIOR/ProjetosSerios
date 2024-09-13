//
//  ChangeColorSystem.swift
//  EcsRealityKitTest001
//
//  Created by Jairo Júnior on 12/09/24.
//

import Foundation
import GameplayKit

class ChangeColorSystem {
    let componentSystem: GKComponentSystem<ColorComponent>
    
    init(entities: [GKEntity]) {
        self.componentSystem = GKComponentSystem(componentClass: ColorComponent.self)
        for entity in entities {
            componentSystem.addComponent(foundIn: entity)
        }
    }
    
    func update() {
        print("Esudesu")
        for component in componentSystem.components {
            let colorComponent = component
            let newColor: SIMD3<Float> = [1.0, 0.0, 0.0]
            colorComponent.updateColor(newColor: newColor)
        }
    }
}

