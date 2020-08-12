//
//  NoteImageURL.swift
//  PickMeUp
//
//  Created by John Luong on 8/6/20.
//  Copyright © 2020 John Luong. All rights reserved.
//

import Foundation

struct NoteImageURL: Codable {
    let photoURL:String
    
    init() {
        self.photoURL = ""
    }
}
