//
//  ColorComponent.swift
//  EcsRealityKitTest001
//
//  Created by Jairo Júnior on 12/09/24.
//

import GameplayKit
import SwiftUI

@Observable
class ColorComponent: GKComponent {
     var color: SIMD3<Float> = [0.0, 0.0, 0.0]
    
    var uiColor: Color {
        return Color(
            red: Double(color.x),
            green: Double(color.y),
            blue: Double(color.z)
        )
    }
    
    func updateColor(newColor: SIMD3<Float>) {
        self.color = newColor
    }
}
