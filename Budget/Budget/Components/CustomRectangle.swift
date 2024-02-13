//
//  Square.swift
//  Budget
//
//  Created by Jairo Júnior on 16/01/24.
//

import Foundation

import SwiftUI

struct CustomRectangle: Shape{
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

