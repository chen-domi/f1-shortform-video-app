//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dominic Chen on 9/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I Am A Programmer!"
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .frame(width: 200, height: 200)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.black)
            
            Spacer()
            
            HStack {
                Button("Awesome!") {
                    message = "Awesome!"
                }
//                .buttonStyle(.borderedProminent)
//                .font(.title2)
//                .tint(.orange)
                
//                Spacer()
                
                Button("Great!") {
                    message = "Great!"
                }
//                .buttonStyle(.borderedProminent)
//                .font(.title2)
//                .tint(.orange)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)

        }
        
        .padding()
        
    }
}

#Preview {
    ContentView()
}
