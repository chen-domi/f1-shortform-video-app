//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dominic Chen on 9/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var image = ""
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.thin)
            
            Spacer()
            
            
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let image1 = "sun.max.fill"
                let image2 = "hand.thumbsup"
                
                message = (message == message1 ? message2 : message1)
                image = (image == image1 ? image2 : image1)
                                
//                if (message == message1) {
//                    message = message2
//                    image = image2
//                } else {
//                    message = message1
//                    image = image1
//                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            .buttonBorderShape(.roundedRectangle)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
