//
//  DisclaimerView.swift
//  Mingo-IT
//
//  Created by tiyas aria on 09/06/23.
//

import SwiftUI

struct DisclaimerView: View {
    @State var isShowingNextScreen  : Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Group {
                    ZStack(alignment: .topLeading) {
                        Image("BubbleChat")
                            .scaleEffect(1.175)
                            .background(
                                Image("BubbleChat")
                                    .scaleEffect(1.175)
                                    .shadow(color: .black,
                                            radius: 0, x: 0, y: 4)
                                    .opacity(0.25)
                            )
                        Text("Hello , Welcome to Mingo . This application is designed with the aim of providing a learning simulation of the world of lectures.\n\nHowever, please note that the app does not replace actual university education or guarantee real-life outcomes.")
                            .font(.custom("SFProRounded-Reguler", size: 18))
                            .offset(x: 10)
                            .foregroundColor(.white)
                            .frame(width: 275.0)
                    }
                    Image("DisclaimerOwl")
                }
                Spacer()
                
                NavigationLink( isActive : $isShowingNextScreen,destination: {
                                    InputNameScreen()
                                }, label: {
                                    MButton(text: "I Understand",
                                            isFullWidth: true, background: Color("primaryOrange"), action: {
                                        isShowingNextScreen = true
                                    }
                                    )
                                })
                                
            }
            
        }
        
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
