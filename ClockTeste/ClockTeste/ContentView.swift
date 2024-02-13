//
//  ContentView.swift
//  Budget
//
//  Created by Jairo Júnior on 02/01/24.
//

import SwiftUI







struct ContentView: View {
    @State var maxH:CGFloat = 300
    @State var maxW:CGFloat = 300
    @State var secDegree:Double = 290
    @State var minDegree:Double = 290
    @State var hourDegree:Double = 290
    @State var maxDegree:Double = 300
    
    @State var showBack:Bool = false

    @State var data = Date()
    
    @State var smallOne = 0.2
    
    var hourFormatter: DateFormatter {
       let formatter = DateFormatter()
       formatter.dateFormat = "HH"
       return formatter
   }
    
    var minFormatter: DateFormatter {
          let formatter = DateFormatter()
          formatter.dateFormat = "mm"
          return formatter
    }
     var secFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "ss"
        return formatter
    }
    
    var body: some View {
        VStack {
//            ZStack{
//                let h: CGFloat = 200
//                let w: CGFloat = 50
//                
//                Rec(y: 0)
//                    .frame(width: w, height: h)
//                    .foregroundColor(.clear)
//                    .border(.black, width: 3)
//                    
//                Rec(y: 100)
//                    .frame(width: w * 0.87 , height: h * 0.98)
//                    .foregroundColor(.red)
//            }
            
            ZStack{
              
                
                Button(action: {
                    maxH = CGFloat.random(in: 100...300)
                    maxW = maxH
//                    print(maxH, maxW)
//                    degree = Double.random(in: 0...300)
//                    print("degree", degree)
                }, label: {
                    ZStack{
                        Circle(startAngle: .degrees(0), endAngle: .degrees(maxDegree), clockWise: false)
                            .stroke(.gray, style: StrokeStyle(lineWidth: 10.5, lineCap: .round, lineJoin: .round))
                            .frame(width: maxW, height: maxH)
                        
                        Circle(startAngle: .degrees(0), endAngle: .degrees(secDegree), clockWise: false)
                            .stroke(.linearGradient(.init(colors: [.cor1, .cor2]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .frame(width: maxW, height: maxH)
                    }
                        .overlay(
                            HStack{
                                ZStack{
//                                    Rectangle()
//                                        .stroke(.red, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
//                                        .frame(width: maxW * 0.25, height: maxH * 0.25)
                                    if showBack{
                                        Circle(startAngle: .degrees(0), endAngle: .degrees(maxDegree), clockWise: false)
                                            .stroke(.gray, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                            .frame(width: maxH * smallOne + 20, height: maxH * smallOne + 20)
                                    }
                                    
                                    Circle(startAngle: .degrees(0), endAngle: .degrees(hourDegree), clockWise: false)
                                        .stroke(.linearGradient(.init(colors: [.cor1, .cor2]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                        .frame(width: maxH * smallOne + 20, height: maxH * smallOne + 20)
                                    
                                    
                                    
                                    
                                    Text(hourFormatter.string(from: data))
                                        .font(.system(size: maxH * smallOne))
                                        .foregroundStyle(.background)
                                        .colorInvert()
                                       
                                        
                                }
                                ZStack{
                                    //                                    Rectangle()
                                    //                                        .stroke(.red, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                    //                                        .frame(width: maxW * 0.25, height: maxH * 0.25)
                                    if showBack{
                                        Circle(startAngle: .degrees(0), endAngle: .degrees(maxDegree), clockWise: false)
                                            .stroke(.gray, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                            .frame(width: maxH * smallOne + 20, height: maxH * smallOne + 20)
                                        
                                    }
                                    Circle(startAngle: .degrees(0), endAngle: .degrees(minDegree), clockWise: false)
                                        .stroke(.linearGradient(.init(colors: [.cor1, .cor2]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                        .frame(width: maxH * smallOne + 20, height: maxH * smallOne + 20)
                                    
                                    Text(minFormatter.string(from: data))
                                        .font(.system(size: maxH * smallOne))
                                        .foregroundStyle(.background)
                                        .colorInvert()
                                }
                            }
                        )
                })
            }
           
            
            Toggle("Show background?", isOn: $showBack)
           
            
//            Rectangle()
//                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//                .frame(width: 300, height: 300)
                
            
            
//            Path { path in
//                path.move(to: .init(x: 200, y: 100))
//                path.addLine(to: .init(x: 100, y: 300))
//                path.addLine(to: .init(x: 300, y: 300))
//                path.addLine(to: .init(x: 200, y: 100))
//                path.closeSubpath()
//            }.stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            
        }
        .padding()
        .onAppear {
           // Set up a Timer to update the data property every second
           Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
               data = Date()
               
               secDegree = ((Double(secFormatter.string(from: data))! /*?? Double(Calendar.current.component(.second, from: data))*/) * 290) / 60
               
               minDegree = ((Double(minFormatter.string(from: data))! /*?? Double(Calendar.current.component(.second, from: data))*/) * 290) / 60
               
               hourDegree = ((Double(hourFormatter.string(from: data))! /*?? Double(Calendar.current.component(.second, from: data))*/) * 290) / 24
           }
       }
    }
}

#Preview {
    ContentView()
}

