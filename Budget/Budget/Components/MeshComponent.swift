//
//  MeshComponent.swift
//  Budget
//
//  Created by Jairo Júnior on 13/02/24.
//

import SwiftUI
import CoreGraphics

struct MeshComponent: View {
    let l:CGFloat = 300
    
    @State var csvFile : [(Double, Double)] = []
    
    @State var hehe: String?
    
    @State var points: [CGPoint] = []
    @State var p = [CGPoint(x: 70, y: 23), CGPoint(x: 3, y: 34)]
    
    var body: some View {
        ZStack{
//            CheckeredMesh().stroke(Color.black, style: .init(lineWidth: 3))
//                        GraphicInMesh().stroke(Color.red, style: .init(lineWidth: 1))
            //
            
            
            Graphical(array: points).stroke(Color.red, style: .init(lineWidth: 2)).frame(width: l, height: l).border(Color.blue)
            GraphicalPoints(array: points).stroke(Color.green, style: .init(lineWidth: 5))
            
            
            
            
            
        }.frame(width: l, height: l)/*.border(.blue)*/
            .onAppear(perform: {
                //                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
               readCSV()
                //                }
            })
    }
    
    func readCSV(){
        do {
            if let path = Bundle.main.path(forResource: "oloko", ofType: "csv") {
                let content = try String(contentsOfFile: path)
                hehe = content
                points = convertStringToCGPoints(content)
            } else {
                print("File not found: oloko")
            }
        } catch {
            print("Error reading file: \(error)")
        }
    }
    
    func convertStringToCGPoints(_ input: String) -> [CGPoint] {
        let lines = input.components(separatedBy: "\r\n")
        var cgPoints: [CGPoint] = []
        
        for line in lines {
            let coordinates = line.components(separatedBy: ",")
            if coordinates.count == 2{
                let x = Double(coordinates[0]) ?? 0
                let y = Double(coordinates[1]) ?? 0
                let point = CGPoint(x: x, y: y)
                cgPoints.append(point)
            }
        }
        return cgPoints
    }
}


#Preview {
    ContentView()
}
