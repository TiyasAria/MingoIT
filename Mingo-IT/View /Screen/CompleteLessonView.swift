//
//  CompleteLessonView.swift
//  Mingo-IT
//
//  Created by Zai on 04/06/23.
//

import SwiftUI

struct CompleteLessonView: View {
    var body: some View {
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
            
//            MButton(text: "Continue", isFullWidth: true, background: Color("primaryOrange"))
        }
    }
}

struct CompleteLessonView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteLessonView()
    }
}
