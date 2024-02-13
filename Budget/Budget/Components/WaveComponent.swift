//
//  WaveComponent.swift
//  Budget
//
//  Created by Jairo Júnior on 11/02/24.
//

import SwiftUI

struct WaveComponent: View {
    @Binding var frequency: Double
    @Binding var strength: Double
    @Binding var phase: Double
    @Binding var speed: Double
    
    var min: Double
    var max: Double
    
    var body: some View {
        ZStack{
            ForEach(0..<6){ i in
                Wave(strength: self.strength, frequency: self.frequency, phase: self.phase)
                    .stroke(Color.black.opacity(Double(i) / 25), lineWidth: 5)
                    .offset(y: CGFloat(i) * 15)
                    
            }
        }.onAppear(perform: {
            withAnimation(Animation.linear(duration: speed).repeatForever(autoreverses: false)) {
                phase = .pi * 2
            }
        })
        
        
    }
}

#Preview {
    ContentView()
}
