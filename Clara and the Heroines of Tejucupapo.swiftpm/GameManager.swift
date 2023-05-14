//
//  GameManager.swift
//  Clara and the Heroines of Tejucupapo
//
//  Created by Jasmini Rebecca Gomes dos Santos on 19/04/23.
//

import Foundation
import AVFoundation
import SwiftUI

class GameManager: ObservableObject {
    @Published var selectedScene = Scenes.scene1

    func goToScene(_ scene: Scenes) {
        withAnimation (.easeInOut(duration: 2)) {
            selectedScene = scene
        }
    }
    lazy var musicSoundEffect: AVAudioPlayer? = {
        guard let soundURL = Bundle.main.url(forResource: "sound", withExtension: "mp3") else {
            print("Could not find sound url")
            return nil
        }
        
        guard let player = try? AVAudioPlayer(contentsOf: soundURL) else {
            print("Could not create audio player")
            return nil
        }
        
        player.numberOfLoops = -1
                
        return player
    }()
    
    func playSound() {
        musicSoundEffect?.play()
    }
}
