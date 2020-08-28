//
//  ContentView.swift
//  PickMeUp
//
//  Created by John Luong on 8/3/20.
//  Copyright © 2020 John Luong. All rights reserved.
//

import SwiftUI
import URLImage

struct GreetingView: View {
    
    @ObservedObject private var greetingVM = GreetingViewModel()
    @State private var showContentView: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView();
            VStack {
                if showContentView {
                    ContentView()
                }
                else {
                    ZStack{
                        BackgroundView();
                        VStack {
                            Text("hey hey hey")
                                .font(.title)
                                .transition(.opacity)
                            Text(self.greetingVM.text)
                                .font(.subheadline)
                            
                            Spacer()
                                .frame(height:100)
                            
                            Button(action: {
                                withAnimation(.spring()) {
                                    self.showContentView = true
                                }
                            }) {
                                Text("Go")
                                    .fontWeight(.semibold)
                                    .font(.title)
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
}

struct ContentView: View {
    
    @ObservedObject var noteImageURLVM = NoteImageURLViewModel()
    @ObservedObject var noteVM = NoteViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView();
            VStack {
                // image
                if (self.noteImageURLVM.photoURL != "") {
                    NoteImageView(self.noteImageURLVM.photoURL)
                        .frame(width:350.0, height:350.0)
                }
                
                Divider()
                
                // note text
                Text(self.noteVM.message)
                .frame(width: 350.0, height: 200.0)
                .foregroundColor(.white)
                .background(Color.init(red: 165/255, green: 140/255, blue: 179/255))
                .cornerRadius(20.0)
                .padding(.all)
                .transition(.slide)
                .animation(.default)
                
                Divider()
                
                Button(action: {
                    withAnimation(.spring()) {
                        self.noteVM.getNew() { note in
                            if (note.attachPhoto == 1) {
                                self.noteImageURLVM.getNew(tagId: note.tagId)
                            }
                            else {
                                self.noteImageURLVM.reset()
                            }
                        }
                    }
                    
                    }) {
                   Text("Anotha")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .padding()
                    .foregroundColor(.white)
//                    .background(Color.init(red: 131/255, green: 139/255, blue: 194/255))
                    .background(Color.init(red: 165/255, green: 140/255, blue: 179/255))
                    .cornerRadius(40)
                }
            }
        }
    }
    
}

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
//                Color.init(red: 192/255, green: 192/255, blue: 242/255),
                Color.init(red: 234/255, green: 231/255, blue: 255/255),
                .white
            ]),
            startPoint: .bottom,
            endPoint: .top)
            .edgesIgnoringSafeArea(.vertical)
    }
}

struct NoteTextView: View {
    var noteText: String;
    
    init(_ noteText: String) {
        self.noteText = noteText
    }
    
    var body: some View {
        ZStack {
            
            Text(self.noteText)
        }
        .background(Color.white)
        
    }
}

struct NoteImageView: View {
    var imageUrl: String;
    
    init(_ imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        URLImage(URL(string: self.imageUrl)!,
        processors: [Resize(size: CGSize(width: 300.0, height: 300.0), scale: UIScreen.main.scale)],
        content: {
           $0.image
               .resizable()
               .aspectRatio(contentMode: .fit)
               .clipShape(RoundedRectangle(cornerRadius: 5))
               .padding(.all, 5.0)
               .shadow(radius: 5.0)
               .clipped()
        
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
