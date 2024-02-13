//
//  ContentViewVm.swift
//  Budget
//
//  Created by Jairo Júnior on 16/01/24.
//

import Foundation
import SwiftUI

extension ContentView{
    @Observable
    class ViewModel{
//             var value1: Double = 175
        var value1: Double = 0
        var value2: Double = 0
        var value3: Double = 0
            
        var h:CGFloat = 200
        
        
        var frequency: Double = 30
        var strength: Double = 30
        var phase: Double = 0
        
        var min: Double = 0
        var max: Double = 50
        var speed = 2.0
    }
}
