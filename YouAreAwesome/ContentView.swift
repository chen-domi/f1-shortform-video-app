//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dominic Chen on 9/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            
            Button("Press Me!") {
//                let message1 = "You are Awesome!"
//                let message2 = "You are Great!"
//                
//                message = (message == message1 ? message2 : message1)
                
                let messages = ["You are Awesome!",
                                "You are Great!",
                                "You are Amazing!",
                                "You are Fantastic!",
                                "You make me smile!",
                                "When the Genius Bar needs help, They Call You!"]
                
                message = messages[messageNumber]
                messageNumber += 1
                
                if (messageNumber == messages.count) {
                    messageNumber = 0
                }
                
                imageName = "image\(imageNumber)"
                imageNumber += 1
                
                if (imageNumber) > 9 {
                    imageNumber = 0
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .buttonBorderShape(.roundedRectangle)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
