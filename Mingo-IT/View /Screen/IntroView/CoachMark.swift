//
//  CoachMark.swift
//  Mingo-IT
//
//  Created by Muhammad Abdul Ghani on 09/06/23.
//

import SwiftUI

struct CoachMark: View {
    @Binding var isFinished: Bool
    @AppStorage("no_coachmark") var no_coachmark = false
    
    let labelTexts = ["Welcome to University", "To begin a lesson, simply click on the building.", "The progress bar above the building represents the progress of the tasks that have been completed.", "You need to reach the specified target for each building.", "Upon completing all the lessons, the gate will open, allowing you to proceed to the next level."]
    
    @State private var currentIndex = 0
    
    var isLastLabel: Bool {
        currentIndex == labelTexts.count - 1
    }
    
    var buttonText: String {
        isLastLabel ? "Finish" : "Next"
    }
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.black).opacity(0.7).edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                Image("stairsGate")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width)
                    .opacity(currentIndex > 3 ? 1 : 0)
                    .animation(.easeInOut)
            }
            
            GeometryReader { geometry in
                Image("closedgateGate")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width)
                    .padding(.top, 10)
                    .opacity(currentIndex > 3 ? 1 : 0)
                    .animation(.easeInOut)
            }
            
            VStack(spacing: 70) {
                HStack(spacing: 100) {
                    buildingView(text: "LOGICAL THINKING", progress: 0.5)
                        .opacity(currentIndex > 2 ? 1 : 0)
                        .animation(.easeInOut)
                    
                    buildingView(text: "UI/UX DESIGN", progress: 0.5)
                        .opacity(currentIndex > 2 ? 1 : 0)
                        .animation(.easeInOut)
                }
                
                HStack(spacing: 100) {
                    buildingView(text: "PROGRAMMING", progress: 0.5)
                        .opacity(currentIndex > 0 ? 1 : 0)
                        .animation(.easeInOut)
                    
                    buildingView(text: "MATHEMATICS", progress: 0.5)
                        .opacity(currentIndex > 2 ? 1 : 0)
                        .animation(.easeInOut)
                }
            }
            .padding(.bottom, 100)
            
            VStack {
                Spacer()
                ZStack {
                    Text(labelTexts[currentIndex])
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 300, height: 200)
                .animation(.easeInOut)
                
                Button(action: {
                    if isLastLabel {
                        isFinished = true
                        print(isFinished)
                        no_coachmark = true
                    } else {
                        currentIndex = (currentIndex + 1) % labelTexts.count
                    }
                }) {
                    Text(buttonText)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .cornerRadius(10)
                }
                .padding(20)
                .animation(.easeInOut)
            }
            .onDisappear {
                isFinished = false
            }
        }
        
    }
    
    private func buildingView(text: String, progress: CGFloat) -> some View {
        let buildingImage = Image("learningBuilding")
        
        return ZStack {
            VStack {
                ZStack {
                    Image("progressBubble")
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: progress * 100, height: 5)
                        .padding(.bottom, 10)
                }
                
                ZStack {
                    buildingImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 90)
                        .edgesIgnoringSafeArea(.all)
                    
                    Text(text)
                        .font(.custom("SFProRounded-Bold", size: 7))
                        .foregroundColor(.white)
                        .padding(.top, 7)
                }
            }
        }
    }
}


struct CoachMark_Previews: PreviewProvider {
    @State static var isFinished = false

    static var previews: some View {
        CoachMark(isFinished: $isFinished)
    }
}
