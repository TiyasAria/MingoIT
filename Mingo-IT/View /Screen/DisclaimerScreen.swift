//
//  DisclaimerView.swift
//  Mingo-IT
//
//  Created by Zai on 02/06/23.
//

import SwiftUI

struct DisclaimerScreen: View {
    var body: some View {
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
                        .offset(x: 10)
                        .foregroundColor(.white)
                        .frame(width: 275.0)
                }
                Image("DisclaimerOwl")
            }
            Spacer()
            MButton(text: "I Understand", isFullWidth: true, background: Color("primaryOrange"))
        }
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerScreen()
    }
}
