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
        VStack {
            if showContentView {
                ContentView()
            }
            else {
                VStack {
                    Text("hey hey hey")
                        .font(.title)
                    Text(self.greetingVM.text)
                        .font(.subheadline)
                    
                    Divider()
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            self.showContentView = true
                        }
                    }) {
                        Text("Go")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
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
            Color.init(red: 149/255, green: 163/255, blue: 164/255)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                    
                if (self.noteImageURLVM.photoURL != "") {
                    URLImage(URL(string: self.noteImageURLVM.photoURL)!,
                             processors: [Resize(size: CGSize(width: 300.0, height: 300.0), scale: UIScreen.main.scale)],
                             content: {
                                $0.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .padding(.all, 20.0)
                                    .shadow(radius: 10.0)
                                    .clipped()
                                
                    })
                        .frame(width:350.0, height:350.0)
                        .transition(AnyTransition.slide)
                        .animation(.default)
                }
                
                Divider()
                
                ZStack {
                    Color.init(red: 238/255, green: 235/255, blue: 211/255)
                    
                    Text(self.noteVM.message)
                    .frame(width:350.0, height:200.0)
                    .cornerRadius(20.0)
                    
                }
                .frame(width:350.0, height:200.0)
                .cornerRadius(20.0)
                .transition(.slide)
//                    .transition(AnyTransition.move(edge:.bottom).combined(with:
//                        .opacity))
//                    .animation(.default)
                
                
                Divider()
                
                Button(action: {
                    self.noteVM.getNew() { note in
                        if (note.attachPhoto == 1) {
                            self.noteImageURLVM.getNew(tagId: note.tagId)
                        }
                        else {
                            self.noteImageURLVM.reset()
                        }
                    }
                    
                    }) {
                   Text("Anotha")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .padding()
//                    .foregroundColor(.white)
                    .foregroundColor(Color.init(red: 238/255, green: 235/255, blue: 211/255))
                    .background(Color.init(red: 169/255, green: 135/255, blue: 67/255))
                    .cornerRadius(40)
                }
            }
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
