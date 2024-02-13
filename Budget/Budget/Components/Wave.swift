//
//  onda.swift
//  Budget
//
//  Created by Jairo Júnior on 05/02/24.
//

import SwiftUI

struct Wave:Shape {
    var strength: Double
    var frequency: Double
    var phase: Double
    
    var animatableData: Double{
        get {phase}
        set {self.phase = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        let width: Double = rect.width
        let height: Double = rect.height
        
        let midWidth = width / 2
        let midHeight = height / 2
        let oneOverMidWidth = 1 / midWidth
        
        let waveLength = width / frequency
        
        for x in stride(from: 0, to: width , by: 1){
//            print("seno de :\(x) é = \(sin(x))")
            let relativeX = x / waveLength
            
            let distanceFromMidWidth = x - midWidth
            let normalDistance = oneOverMidWidth * distanceFromMidWidth
            let parabola = -pow(normalDistance, 2) + 1
            
            let sine = sin(relativeX + phase)
            let y = parabola * strength * sine + midHeight
            
            let point = CGPoint(x: x, y: y)
//            print("\(x), \(y)")
            
            if x == 0{
                path.move(to: point)
            }else{
                path.addLine(to: point)
            }
        }
        return Path(path.cgPath)
    }
}

#Preview {
    ContentView()
}
