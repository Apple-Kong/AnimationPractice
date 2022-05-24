//
//  ViewTransition.swift
//  AnimationPractice
//
//  Created by GOngTAE on 2022/05/24.
//

import SwiftUI

struct ViewTransition: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                Text("View transition")
            } else {
                RoundedRectangle(cornerRadius: 30)
                    .fill(.blue)
                    .padding()
                    .transition(.scale(scale: 0.1, anchor: .bottomTrailing))
                    .zIndex(1)
                    .onAppear {
                        print("Wow")
                    }
                    .onDisappear {
                        print("")
                    }

            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

struct ViewTransition_Previews: PreviewProvider {
    static var previews: some View {
        ViewTransition()
    }
}
