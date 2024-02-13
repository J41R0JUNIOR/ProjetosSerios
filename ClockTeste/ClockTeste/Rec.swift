//
//  Rec.swift
//  ClockTeste
//
//  Created by Jairo Júnior on 09/01/24.
//

import SwiftUI

struct Rec: Shape{
    let y: CGFloat
  
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .init(x: rect.minX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.minY + y))
        path.addLine(to: .init(x: rect.maxX, y: rect.minY + y))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY ))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY ))
        
        return path
    }
}


