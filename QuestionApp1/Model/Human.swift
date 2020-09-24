//
//  Human.swift
//  QuestionApp1
//
//  Created by Hiro-Ume on 2020/09/24.
//  Copyright © 2020 Hiroaki Umekawa. All rights reserved.
//

import Foundation


class Human: Animal {
    override func Breath() {
        super.Breath()
        profile()
    }
    
    func profile(){
        print("私はひろさんです")
    }
}
