//
//  Component1.swift
//  Budget
//
//  Created by Jairo Júnior on 16/01/24.
//

import Foundation
import SwiftUI

struct GraphicalComponent: View{
    @Binding var value1: Double
    @Binding var value2: Double
    @Binding var value3: Double
    @Binding var h:CGFloat
    var mult:Double = 0.7
    var w: CGFloat { (h * 50) / 200 }
        
    var body: some View {
        VStack{
            Button(action: {
                value1 = Double.random(in: 0...h * 0.7)
                value2 = Double.random(in: 0...h * 0.7)
                value3 = Double.random(in: 0...300)
                
            }, label: {
                ZStack{
                    CustomCircle(startAngle: .degrees(0), endAngle: .degrees(300), clockWise: false)
                        .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .frame(width: h, height: h)
                    
                    CustomCircle(startAngle: .degrees(0), endAngle: .degrees(value3), clockWise: false)
                        .stroke(.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                        .frame(width: h, height: h)
                    HStack{
                        CustomRectangle(y: value2)
                            .frame(width: w * mult, height: h * mult)
                            .foregroundColor(.blue)
                        
                        CustomRectangle(y: value1)
                            .frame(width: w * mult, height: h * mult)
                            .foregroundColor(.red)
                    }
                }
            })
        }
    }
}
