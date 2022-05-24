//
//  ContentView.swift
//  AnimationPractice
//
//  Created by GOngTAE on 2022/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .bold()
                .foregroundColor(.white)
            
        }
        .padding()
        .frame(width: show ? 320 : 300, height: show ? 600 : 44)
        .background(.blue)
        .cornerRadius(30)
        .shadow(color: .blue.opacity(0.5), radius: 20)
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
