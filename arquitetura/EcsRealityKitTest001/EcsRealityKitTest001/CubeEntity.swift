//
//  CubeEntity.swift
//  EcsRealityKitTest001
//
//  Created by Jairo Júnior on 12/09/24.
//

import Foundation
import GameplayKit
import SwiftUI

@Observable
class CubeEntity: GKEntity {
    var colorComponent: ColorComponent
    
    override init() {
        self.colorComponent = ColorComponent()
        super.init()
        addComponent(colorComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

