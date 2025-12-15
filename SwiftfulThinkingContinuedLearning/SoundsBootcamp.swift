//
//  SoundsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 15/12/25.
//

import SwiftUI
import AVKit

class SoundManager {
    static let shared = SoundManager()
    
    private init() {
        
    }
    
    var player: AVAudioPlayer?
    
    func playSound(url: String) {
        guard let url = Bundle.main.url(forResource: url, withExtension: ".mp3") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error play sound: \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                SoundManager.shared.playSound(url: "running-sound-effect")
                
            }
            Button("Play sound 2") {
                
            }
        }
    }
}

#Preview {
    SoundsBootcamp()
}
