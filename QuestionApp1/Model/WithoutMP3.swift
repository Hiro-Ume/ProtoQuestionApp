//
//  WithoutMP3.swift
//  QuestionApp1
//
//  Created by Hiro-Ume on 2020/09/24.
//  Copyright © 2020 Hiroaki Umekawa. All rights reserved.
//

import Foundation

class WithoutMP3: SoundFile {
    override func playSound(fileName: String, extentionName: String) {
        
        if extentionName == "mp3"{
            print("このファイルは再生できません。")
            
        }
        player?.stop()
    }
}
