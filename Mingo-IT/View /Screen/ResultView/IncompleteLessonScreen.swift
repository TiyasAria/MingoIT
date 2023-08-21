//
//  IncompleteLessonView.swift
//  Mingo-IT
//
//  Created by Zai on 04/06/23.
//

import SwiftUI

struct IncompleteLessonScreen : View {
//    let previousScreenType : PreviousScreen.Type
    let materialType  : QuizMaterial
    
    @StateObject var userData = ScoreManager()
    @State var isActive = false
    @Environment(\.presentationMode) var presentationMode

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
                        Text("Programming + \(userData.scoreProgramming)")
                    case .logic :
                        Text("Logic + \(userData.scoreLogic)")
                    case .mathematic :
                        Text("Mathematic + \(userData.scoreMath)")
                    case .design :
                        Text("Design + \(userData.scoreDesign)")
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

//struct IncompleteLessonView_Previews: PreviewProvider {
//    static var previews: some View {
//        IncompleteLessonScreen()
//    }
//}
