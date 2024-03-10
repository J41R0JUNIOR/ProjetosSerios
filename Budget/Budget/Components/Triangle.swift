//
//  Triangle.swift
//  Budget
//
//  Created by Jairo Júnior on 26/02/24.
//

//

import SwiftUI

struct Triangle: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .init(x: rect.midX, y: rect.minY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        
        
        return path
    }
}

#Preview {
    ContentView()
}
