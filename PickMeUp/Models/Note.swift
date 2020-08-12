//
//  Note.swift
//  PickMeUp
//
//  Created by John Luong on 8/6/20.
//  Copyright © 2020 John Luong. All rights reserved.
//

import Foundation

struct Note: Codable {
    let message:String
    let tagId:Int
    let attachPhoto:Int
    
    init() {
        self.message = ""
        self.tagId = 0
        self.attachPhoto = 0
    }
    
}
