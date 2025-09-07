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
            
            Spacer()
            
            
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let image0 = "image0"
                let image1 = "image1"
                
                message = (message == message1 ? message2 : message1)
                
                imageName = "image\(imageNumber)"
                imageNumber += 1
                
                if (imageNumber) > 9 {
                    imageNumber = 0;
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
