//
//  CompleteLessonView.swift
//  Mingo-IT
//
//  Created by Zai on 04/06/23.
//

import SwiftUI

struct CompleteLessonScreen : View {
//    let previousScreenType : PreviousScreen.Type
    let materialType  : QuizMaterial

    @State private var isActive = false
    @StateObject var userData = ScoreManager()
    
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

//struct CompleteLessonView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompleteLessonScreen<PreviousScreen: View>(previousScreenType: LogicView.self)
//    }
//}
