//
//  NextViewController.swift
//  QuestionApp1
//
//  Created by Hiro Ume on 2020/08/27.
//  Copyright © 2020 Hiro Ume. All rights reserved.
//

import UIKit

protocol NowScoreDelegate {
    func nowScore(score: Int)
}

class NextViewController: UIViewController {

    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    
    var correctedCount = Int()
    var wrongCount = Int()
    
    var beforeCount = Int()
    
    var delegate: NowScoreDelegate?
    
    var soundFile = SoundFile()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        correctLabel.text = String(correctedCount)
        wrongLabel.text =  String(wrongCount)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil {
            beforeCount = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }
        
        //最高得点だったときに音を鳴らす
        if beforeCount < correctedCount{
            soundFile.playSound(fileName: "sound", extentionName: "mp3")
        }
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        //もし最高得点であれば値を保存する
        if beforeCount < correctedCount {
            UserDefaults.standard.set(correctedCount, forKey: "beforeCount")
            delegate?.nowScore(score: correctedCount)
        } else if beforeCount > correctedCount {
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
        }
        //そうでなければ値は渡さない
        
        dismiss(animated: true, completion: nil)
    }
    
   

}
