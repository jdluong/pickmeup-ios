//
//  NoteViewModel.swift
//  PickMeUp
//
//  Created by John Luong on 8/7/20.
//  Copyright © 2020 John Luong. All rights reserved.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var note: Note
    
    init() {
        self.note = Note()
    }
    
    func getNew(completion: @escaping (Note) -> ()) {
        ApiService().getRandNote() { note in
            if let note = note {
                self.note = note
                completion(note)
            }
        }
    }
    
    var message:String {
        return self.note.message
    }
    
    var tagId:Int {
        return self.note.tagId
    }
    
    var attachPhoto:Int {
        return self.note.attachPhoto
    }
    
}
