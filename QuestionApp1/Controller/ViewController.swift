//
//  ViewController.swift
//  QuestionApp1
//
//  Created by Hiro Ume on 2020/08/27.
//  Copyright © 2020 Hiro Ume. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NowScoreDelegate {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    let imagesList = ImagesList()
    
    //IBActionで拾ってきた正答がどちら
    var pickedAnswer = false
    
    //SoundFileクラスを宣言して実体化
    var soundFile = SoundFile()
    
    //ChangeColorクラスを宣言して実体化
    var changeColor = ChangeColor()
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 20.0
        gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.26, topAlpha: 1.0, bottomR: 0.54, bottomG: 0.74, bottomB: 0.74, bottomAlpha: 1.0)
        
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named:imagesList.list[0].imageText)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil {
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        } 
        maxScoreLabel.text = String(maxScore)
    }

    
    
    
    @IBAction func answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1 {
            
           
            
            pickedAnswer = true
    
            
            //○ボタンの音声を流す
            
        }else if (sender as AnyObject).tag == 2{
            
            
            pickedAnswer = false
            
            
        }
        
        //チェック解答が合っているか(pickedAnswerとcorrectOrNotの値が一致しているか)
        check()
        nextQuestions()
    }
    
    
    
    
    func check(){
        let correctAnswer = imagesList.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            print("正解")
            correctCount = correctCount + 1
            //SoundFileクラスのplaySoundを使ってマルの音を鳴らす
            soundFile.playSound(fileName: "maruSound", extentionName: "mp3")
        }else{
            print("間違い")
            wrongCount = wrongCount + 1
            //バツの音を鳴らす
            soundFile.playSound(fileName: "batsuSound", extentionName: "mp3")
            
        }
    }
    
    func nextQuestions(){
        if questionNumber <= 9{
            questionNumber = questionNumber + 1
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
        }else{
            print("問題が終了しました")
            //画面遷移
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    func nowScore(score: Int) {
        maxScoreLabel.text = String(score)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as! NextViewController
            
            nextVC.correctedCount = correctCount
            nextVC.wrongCount = wrongCount
            nextVC.delegate = self
        }
    }

    //resetボタンを押すと最高得点がリセットされる
    @IBAction func resetScore(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "beforeCount")
        maxScoreLabel.text = "0"
    }
    
    
    
    
    
    
}

