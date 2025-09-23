//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dominic Chen on 9/6/25.
//

import SwiftUI
import AVKit
import AVFAudio

struct F1Moment {
    let text: String
    let videoName: String
}
struct ContentView: View {
    @State private var currentMoment: F1Moment = F1Moment(text: "", videoName: "")
    @State private var lastMomentIndex = -1
    @State private var player: AVPlayer!
    @State private var soundIsOn = true
    
    let f1Moments = [
        F1Moment(text: "Words of wisdom",
                 videoName: "is-there-a-leakage"),
        F1Moment(text: "Where am I supposed to go???",
                 videoName: "sergio-checo-perez"),
        F1Moment(text: "Oscar Pastry🥐",
                 videoName: "griddy"),
        F1Moment(text: "Dutch National Anthem",
                 videoName: "dududu"),
        F1Moment(text: "High Performance Athlete",
                 videoName: "kikiki"),
        F1Moment(text: "I am stupid x2",
                 videoName: "i-am-stupid"),
        F1Moment(text: "No Michael, no no!",
                 videoName: "no-michael"),
        F1Moment(text: "SMOOOOOOTH OPERATOR",
                 videoName: "smooth-operator"),
    ]
    
    var body: some View {
        VStack {
            //            Spacer()
            Text(currentMoment.text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: currentMoment.text)
            
            Spacer()
            
            if let player = player {
                VideoPlayer(player: player)
                    .frame(maxHeight: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(radius: 30)
                    .onAppear() {
                        player.play()
                    }
            } else {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.gray.opacity(0.3))
                    .frame(maxHeight: 400)
                    .overlay(
                        Text("Tap 'Show F1 Moments' to start")
                            .foregroundStyle(.gray)
                    )
            }
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {_, newValue in
                        updateSoundState(isOn: newValue)
                    }
                
                Spacer()
                
                Button("Show F1 Moments") {
                    showRandomMoment()
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .buttonBorderShape(.roundedRectangle)
            }
        }
        .tint(.accentColor)
        .padding()
        .onDisappear {
            player?.pause()
        }
    }
    
    func showRandomMoment() {
        player?.pause()
        
        lastMomentIndex = nonRepeatingRandom(lastNumber: lastMomentIndex, upperBound: f1Moments.count)
        
        currentMoment = f1Moments[lastMomentIndex]
        
        loadVideo(videoName: currentMoment.videoName)
    }
    
    func loadVideo(videoName: String) {
        let extensions = ["mov", "mp4", "MOV", "MP4"]
        var videoURL: URL?
        
        for ext in extensions {
            if let url = Bundle.main.url(forResource: videoName, withExtension: ext) {
                videoURL = url
                print("✅ Found video: \(videoName).\(ext)")
                break
            }
        }
        
        guard let validURL = videoURL else {
            print("🎥 Could not find video file with any extension: \(videoName)")
            return
        }
        
        player = AVPlayer(url: validURL)
        updateSoundState(isOn: soundIsOn)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            player?.play()
            
        }
    }
    func updateSoundState(isOn: Bool) {
        guard let player = player else {return}
        
        if isOn {
            player.isMuted = false
            player.volume = 1.0
        } else {
            player.isMuted = true
            player.volume = 0.0
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...(upperBound - 1))
        } while newNumber == lastNumber && upperBound > 1
        return newNumber
    }
}

#Preview {
    ContentView()
}
