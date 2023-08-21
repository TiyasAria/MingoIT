//
//  IncompleteLessonView.swift
//  Mingo-IT
//
//  Created by Zai on 04/06/23.
//

import SwiftUI

struct IncompleteLessonScreen : View {
    let materialType  : QuizMaterial
    @EnvironmentObject private var scoreUser : ScoreManager
    @State var isActive = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var lessonViewModel : LessonViewModel

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("InCompleteOwl")
                
                VStack(spacing: 10) {
                    Text("It’s Okay!")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("You're already great at this stage, let's be more thorough.")
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
                .padding(17)
                .font(.title3)
                .fontWeight(.bold)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.init(hex: "54AAB4"), lineWidth: 2)
                )
                
                Spacer()
                
                VStack(spacing: -20) {
                    MButton(text: "Try Again", isFullWidth: true, background: Color("primaryBlue")) {
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    NavigationLink(isActive: $isActive, destination: {
                        GateView()
                    }, label: {
                        MButton(text: "Continue", isFullWidth: true, background: Color("primaryOrange")) {
                            isActive = true
                        }
                    }) 
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
