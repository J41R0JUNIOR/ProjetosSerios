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
    let divider = 10
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
           
            
            let y = -(fX(x: x - midWidth)
                      
            )
            
            
            
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
        let value = pow(x, 3) - (2 * x)
        return (value)/Double(divider)
    }
}



struct Graphical: Shape {
    let array: [CGPoint]
   

    func path(in rect: CGRect) -> Path {
        let minWidth = rect.minX
        let minHeight = rect.minY
        
        let midWidth = rect.width/2
        let midHeight = rect.height/2
        
        let maxWidth = rect.width
        let maxHeight = rect.height

        let sortedArray = array.sorted { $0.x < $1.x }
        let greatX = sortedArray.last?.x
        let smallestX = sortedArray.first?.x
        
        print(greatX)
        print(smallestX)
        
        let path = UIBezierPath()

        for point in sortedArray.indices {
            var point = sortedArray[point]
            
            point.x += midWidth
            point.y = maxHeight - (point.y + midHeight)
            
            
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
            let midWidth = rect.width / 2
            let midHeight = rect.height / 2
            var point = array[pointInArray]

            point.x += midWidth
            point.y = rect.height - (point.y + midHeight)
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
