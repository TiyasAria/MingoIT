//
//  CompleteLessonView.swift
//  Mingo-IT
//
//  Created by Zai on 04/06/23.
//

import SwiftUI

struct CompleteLessonScreen : View {
    let materialType  : QuizMaterial
    @State private var isActive = false
    @EnvironmentObject private var scoreUser : ScoreManager

    var body: some View {
        NavigationStack {
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
                    switch materialType{
                    case .programming :
                        Text("Programming + \(scoreUser.scoreProgramming)")
                    case .logic :
                        Text("Logic + \(scoreUser.scoreLogic)")
                    case .mathematic :
                        Text("Mathematic + \(scoreUser.scoreMath)")
                    case .design :
                        Text("Design + \(scoreUser.scoreDesign)")
                    default :
                        Text("")
                    }
                   
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
            
                NavigationLink(destination: GateView(), isActive: $isActive) {
                    MButton(text: "Continue", isFullWidth: true, background: Color("primaryOrange"), action: {
                        isActive = true
                    })
                }
            }
        }
        .navigationBarHidden(true)
    }
}
