//
//  CheckeredMesh.swift
//  Budget
//
//  Created by Jairo Júnior on 13/02/24.
//

import SwiftUI

struct CheckeredMesh: Shape{
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        let width: Double = rect.width
        let height: Double = rect.height
        
        //x1
        for x in stride(from: 0, to: width/2 , by: 1){
            let point = CGPoint(x: x, y: height/2)
           
            if x == 0{
                path.move(to: point)
            }else{
                path.addLine(to: point)
            }
        }
        //y1
        for y in stride(from: rect.minY, to: height/2 , by: 1){
            let point = CGPoint(x: width/2, y: y)
            path.addLine(to: point)
        }
        //x2
        for x in stride(from: 0, to: width , by: 1){
            let point = CGPoint(x: x, y: height/2)
            path.addLine(to: point)
        }
        //y2
        for y in stride(from: height/2, to: height , by: 1){
            let point = CGPoint(x: width/2, y: y)
            path.addLine(to: point)
        }
        return Path(path.cgPath)
    }
}

struct GraphicInMesh: Shape{
    let divider = 1000.0
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        let minWidth = rect.minX
        let minHeight = rect.minY
        
        let midWidth = rect.width/2
        let midHeight = rect.height/2
        
        let maxWidth = rect.width
        let maxHeight = rect.height
        

        for x in stride(from: minWidth, to: maxWidth , by: 0.01){
            
            let formattedX = (x - midWidth) + midWidth
           
            
            let y = -(fX(x: x - midWidth, funcX: {x1 in 
                return
                /*(formattedX - midWidth) * sin(formattedX - midWidth)*/
                (pow(x1, 3) - x1 + 2)/divider
                
            }) /*- midHeight*/)
            
            let formattedY = midHeight + y
            
           
            var point = CGPoint(x: formattedX, y: formattedY)
            
            if point.x >= minWidth && point.y >= minHeight && point.x <= maxWidth && point.y <= maxHeight{
                path.move(to: point)
                
                point.y += 2
                path.addLine(to: point)
                
                point.y -= 4
                path.addLine(to: point)
            }
        }
        return Path(path.cgPath)
    }
    
    func fX(x: Double, funcX: (_ x1:Double)->Double) -> Double{
        return funcX(x)
//        return ((x * x) - x + 2)/divider
    }
}


#Preview {
    ContentView()
}
