//
//  NoteImageURLViewModel.swift
//  PickMeUp
//
//  Created by John Luong on 8/6/20.
//  Copyright © 2020 John Luong. All rights reserved.
//

import Foundation

class NoteImageURLViewModel: ObservableObject {
    @Published var noteImageURL: NoteImageURL
    
    init() {
        self.noteImageURL = NoteImageURL()
    }
    
    func getNew(tagId:Int) {
        ApiService().getRandNoteImageURLByTag(tagId: tagId) { noteImageURL in
            if let noteImageURL = noteImageURL {
                self.noteImageURL = noteImageURL
            }
        }
    }
    
    func reset() {
        self.noteImageURL = NoteImageURL()
    }
    
    var photoURL: String {
        return self.noteImageURL.photoURL
    }
    
    
}
