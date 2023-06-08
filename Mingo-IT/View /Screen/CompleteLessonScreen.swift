//
//  CompleteLessonView.swift
//  Mingo-IT
//
//  Created by Zai on 04/06/23.
//

import SwiftUI

struct CompleteLessonScreen: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("CompleteOwl")
                
                VStack(spacing: 10) {
                    Text("Great Job !")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Congratulations, you conquer this \nmaterial well.")
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                HStack {
                    Image(systemName: "desktopcomputer")
                    Text("Programming + 3")
                }
                .frame(width: 310)
                .padding(15)
                .font(.title3)
                .fontWeight(.bold)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("primaryBlue"), lineWidth: 2)
                )
                
                Spacer()
            
                NavigationLink(destination: IncompleteLessonScreen(), isActive: $isActive) {
                    MButton(text: "Continue", isFullWidth: true, background: Color("primaryOrange")) 
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct CompleteLessonView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteLessonScreen()
    }
}
