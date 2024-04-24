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
    let divider = 100
    let a = UIScreen.main.bounds.width
//    var  funcX: () -> Double
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        let minWidth = rect.minX
        let minHeight = rect.minY
        
        let midWidth = rect.width/2
        let midHeight = rect.height/2
        
        let maxWidth = rect.width
        let maxHeight = rect.height
        

        for x in stride(from: minWidth, to: maxWidth , by: 0.1){
            
            let formattedX = ((x - midWidth) + midWidth)
           
            
            let y = -(fX(x: x - midWidth))
            
            
            
            let formattedY = (midHeight + y) /*/ Double(divider)*/
            
           
            var point = CGPoint(x: formattedX, y: formattedY)
            
            if point.x >= minWidth && point.y >= minHeight && point.x <= maxWidth && point.y <= maxHeight{
                path.move(to: point)
                
                point.y += 1
                path.addLine(to: point)
                
                point.y -= 2
                path.addLine(to: point)
            }
        }
        return Path(path.cgPath)
    }
    
    func fX(x: Double) -> Double{
//        return funcX(x)
//        let value = pow(x, 3) - (2 * x)
        let value = sin(x)
        return (value)/Double(divider)
    }
}



struct Graphical: Shape {
    let array: [CGPoint]
   
    func path(in rect: CGRect) -> Path {
        let maxWidth = rect.width
        let maxHeight = rect.height

        let sortedArrayX = array.sorted { $0.x < $1.x }
        let greatX = sortedArrayX.last?.x
        let smallestX = sortedArrayX.first?.x
        
        let sortedArrayY = array.sorted { $0.y < $1.y }
        let greatY = sortedArrayY.last?.y
        let smallestY = sortedArrayY.first?.y
        let path = UIBezierPath()

        for point in sortedArrayX.indices {
            var point = sortedArrayX[point]

            point.x = CGFloat(point.x - (smallestX ?? 1)) / ((greatX ?? 1) - (smallestX ?? 1)) * maxWidth
         
            point.y = (-(point.y - (smallestY ?? 1)) / ((greatY ?? 1) - (smallestY ?? 1)) * maxHeight) + maxHeight

            if path.isEmpty {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }

        return Path(path.cgPath)
    }
}

struct GraphicalPoints: Shape {
    let array: [CGPoint]

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()

        for pointInArray in array.indices {
            let maxWidth = rect.width
            let maxHeight = rect.height
            
            var point = array[pointInArray]
            let sortedArrayX = array.sorted { $0.x < $1.x }
            let greatX = sortedArrayX.last?.x
            let smallestX = sortedArrayX.first?.x
            
            let sortedArrayY = array.sorted { $0.y < $1.y }
            let greatY = sortedArrayY.last?.y
            let smallestY = sortedArrayY.first?.y

            point.x = CGFloat(point.x - (smallestX ?? 1)) / ((greatX ?? 1) - (smallestX ?? 1)) * maxWidth
         
            point.y = (-(point.y - (smallestY ?? 1)) / ((greatY ?? 1) - (smallestY ?? 1)) * maxHeight) + maxHeight
            
            path.move(to: point)

            point.y += 1
            path.addLine(to: point)

            point.y -= 2
            path.addLine(to: point)
        }

        return Path(path.cgPath)
    }
}

#Preview {
    ContentView()
}
