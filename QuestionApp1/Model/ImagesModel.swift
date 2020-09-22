//
//  ImagesModel.swift
//  QuestionApp1
//
//  Created by Hiro Ume on 2020/08/31.
//  Copyright © 2020 Hiro Ume. All rights reserved.
//

import Foundation


class ImagesModel {
    //画像名を取得して画像名が人間かそうでないかをフラグによって判定する機能
    
    let imageText: String
    let answer: Bool
    
    init(imageName:String, correctOrNot: Bool){
        imageText = imageName
        
        answer =  correctOrNot
    }
}
