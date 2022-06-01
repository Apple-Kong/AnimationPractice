//
//  TrasformAnimationView.swift
//  AnimationPractice
//
//  Created by GOngTAE on 2022/06/01.
//

import SwiftUI

struct TrasformAnimationView: View {
    @State var show = false
    @State var show2 = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 300, height: 200)
                .rotation3DEffect(
                    Angle(degrees: show2 ? 360 * 90 + 90 : 90),
                    axis: (x: 0, y: 0, z: 1),
                    anchor: .center,
                    anchorZ: 0.0,
                    perspective: 1
                )
            
            RoundedRectangle(cornerRadius: 30)
                .fill(.pink)
                .frame(width: 300, height: 200)
//                .offset(y: show ? -200 : 0)
//                .scaleEffect(show ? 1.2 : 1)
//                .rotationEffect(Angle(degrees: show ? 30 : 0))
                .rotation3DEffect(
                    Angle(degrees: show ? 360 * 10 : 0),
                    axis: (x: 0, y: 0, z: 1),
                    anchor: .center,
                    anchorZ: 0.0,
                    perspective: 1
                )
                .onTapGesture {
                    withAnimation(.linear(duration: 5)) {
                        show.toggle()
                    }
                    
                    DispatchQueue.main.async {
                        withAnimation(.linear(duration: 5)) {
                            show2.toggle()
                        }
                    }
      
                }
            }
    }
}


struct TrasformAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TrasformAnimationView()
    }
}
