//
//  PathPractice.swift
//  AnimationPractice
//
//  Created by GOngTAE on 2022/05/26.
//

import SwiftUI

let p1 = CGPoint(x: 50, y: 50)
let p2 = CGPoint(x: 100, y: 25)
let p3 = CGPoint(x: 100, y: 100)


struct PathPractice: View {
//    @State var toggle = true
    @State var controlPoint = CGPoint(x: 250, y: 0)
    @State var startPoint = CGPoint(x: 0, y: 0)
    @State var endPoint = CGPoint(x: 800, y: 0)
    
    var body: some View {
        
        VStack {
            Button {
                
                DispatchQueue.main.async {
                    withAnimation(.easeOut(duration: 0.4)) {
                        controlPoint = CGPoint(x: 250, y: -260)
                        endPoint = CGPoint(x: 414, y: -100)
                    }
                }
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.08, blendDuration: 0.3)) {
                        controlPoint = CGPoint(x: 250, y: 0)
                        
                    }
                }
               
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.05, blendDuration: 0.3)) {
                        startPoint = CGPoint(x: 0, y: -50)

                    }
                }
                
            } label: {
                Text("Toggle")
            }
            
            Spacer()

            Raindrop(start: startPoint, control: controlPoint, end: endPoint)
                .fill(.pink)
                .frame(width: 400, height: 400)
                
        }
      
    }
}

struct PathPractice_Previews: PreviewProvider {
    static var previews: some View {
        PathPractice()
    }
}

struct Raindrop: Shape {
//    @Binding var toggle: Bool
    var start: CGPoint
    var control: CGPoint
    var end: CGPoint
    
    
    
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: start)
           
            path.addQuadCurve(to: CGPoint(x: start.x + 500, y: start.y), control: CGPoint(x: control.x, y: control.y + start.y))
            path.addLine(to: CGPoint(x: rect.size.width, y: 600))
            path.addLine(to: CGPoint(x: 0, y: 600))
            path.addLine(to: CGPoint(x: 0, y: 0))
//            path.addQuadCurve(to: CGPoint(x: 0, y: 0), control: CGPoint(x: 0, y: rect.size.height))
        }
    }
}



extension Raindrop {
    var animatableData: AnimatablePair<CGPoint.AnimatableData, CGPoint.AnimatableData> {
        get { AnimatablePair(start.animatableData, control.animatableData) }
        set { (start.animatableData, control.animatableData) = (newValue.first, newValue.second) }
    }
}
