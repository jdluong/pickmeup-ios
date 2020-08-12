//
//  GreetingViewModel.swift
//  PickMeUp
//
//  Created by John Luong on 8/5/20.
//  Copyright © 2020 John Luong. All rights reserved.
//

import Foundation

class GreetingViewModel: ObservableObject {
    @Published var greeting: Greeting = Greeting()
    
    init() {
        ApiService().getRandGreeting() { greeting in
            if let greeting = greeting {
                self.greeting = greeting
            }
        }
    }
    
    func getNew() {
        ApiService().getRandGreeting { greeting in
            if let greeting = greeting {
                self.greeting = greeting
            }
        }
    }
    
    var text: String {
        return self.greeting.text
    }
    
}
