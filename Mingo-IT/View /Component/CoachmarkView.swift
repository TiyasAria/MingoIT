//
//  CoacmarkView.swift
//  Mingo-IT
//
//  Created by tiyas aria on 07/06/23.
//


import SwiftUI

struct CoachmarkView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Text("Welcome to Coachmark!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                Text("Tap anywhere to dismiss")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
            }
            .background(Color.blue)
            .cornerRadius(10)
            .padding()
            .opacity(isShowing ? 1 : 0) // Set opacity based on isShowing state
            .animation(.easeInOut(duration: 0.3)) // Set animation duration
        }
        .onTapGesture {
            isShowing = false // Dismiss the coachmark on tap
        }
    }
}

