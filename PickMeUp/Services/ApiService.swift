//
//  ApiService.swift
//  PickMeUp
//
//  Created by John Luong on 8/5/20.
//  Copyright © 2020 John Luong. All rights reserved.
//

import Foundation

class ApiService {
    
    let API = ApiURL()
    
    // GREETINGS
    
    func getRandGreeting(completion: @escaping (Greeting?) -> ()) {
        
        guard let url = URL(string: "\(API.GREETINGS)/text/random") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let greeting = try? JSONDecoder().decode(Greeting.self, from:data)
            
            DispatchQueue.main.async {
                completion(greeting)
            }
        }.resume()
        
    }
    
    // NOTES
    
    func getRandNote(completion: @escaping (Note?) -> ()) {
        
        guard let url = URL(string: API.NOTES) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let note = try! JSONDecoder().decode(Note.self, from:data)
            
            DispatchQueue.main.async {
                completion(note)
            }
            
        }.resume()
    }
    
    // PHOTOS
    
    func getRandNoteImageURLByTag(tagId:Int, completion: @escaping (NoteImageURL?) -> ()) {
        
        guard let url = URL(string: "\(API.PHOTOS)/\(tagId)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let noteImageURL = try! JSONDecoder().decode(NoteImageURL.self, from:data)

            DispatchQueue.main.async {
                completion(noteImageURL)
            }
        }.resume()
    }
    
    
}

struct ApiURL {
    var GREETINGS = "https://pickmeup-api-123.herokuapp.com/greetings"
    var NOTES = "https://pickmeup-api-123.herokuapp.com/notes/random"
    var PHOTOS = "https://pickmeup-api-123.herokuapp.com/photos/random"
}
