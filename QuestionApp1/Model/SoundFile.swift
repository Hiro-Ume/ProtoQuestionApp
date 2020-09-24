//
//  SoundFile.swift
//  QuestionApp1
//
//  Created by Hiro-Ume on 2020/09/24.
//  Copyright © 2020 Hiroaki Umekawa. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile {
    var player : AVAudioPlayer?
    
    func playSound(fileName: String, extentionName: String) {
        
        //再生する
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extentionName)
        
        do {
            //効果音を流す
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
            
            
        } catch  {
            print("エラーです!")
        }
        
    }
    
}
