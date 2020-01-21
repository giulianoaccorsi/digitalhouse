//
//  Audio.swift
//  03 - Desafio (Tabuada)
//
//  Created by Giuliano Accorsi on 29/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import AVFoundation

var player: AVAudioPlayer?

func playSound(soundName: String) {
    guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
        
        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        
        /* iOS 10 and earlier require the following line:
         player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
        
        guard let player = player else { return }
        
        player.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}
