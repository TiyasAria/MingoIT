//
//  ExtensionsGateView.swift
//  Mingo-IT
//
//  Created by tiyas aria on 19/08/23.
//

import SwiftUI

extension GateView {
    
     func buildingButton(action: @escaping () -> Void, text: String) -> some View {
        let buildingImage = Image("learningBuilding")
        
        return Button(action: action) {
            VStack {
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
    
     func arrowView() -> some View {
        let arrowImage = Image("arrow")
        
        return arrowImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 15)
            .edgesIgnoringSafeArea(.all)
    }
    
     func openedGateImage(width: CGFloat) -> some View {
        Image("openedgateGate")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width)
            .padding(.top, 10)
    }
    
     func closedGateImage(width: CGFloat) -> some View {
        Image("closedgateGate")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width)
            .padding(.top, 10)
    }
    
    func logicalView() -> some View {
        NavigationLink(destination: gateViewModel.chooseDestinationLogic(), isActive: $gateViewModel.shouldNavigateToLogicView) {
            VStack {
                ZStack {
                    Image("progressBubble")
                    
                    Text("Score \(scoreManager.scoreLogic)")
                        .font(.system(size: 10 , weight: .bold , design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom,10)
                    
                }
                
                buildingButton(action: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        gateViewModel.selectedButton = "logic"
                        withAnimation(.easeOut(duration: 0.5)){
                            gateViewModel.mingoGatePosition = CGPoint(x: gateViewModel.mingoGatePosition.x - 120, y: gateViewModel.mingoGatePosition.y)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            gateViewModel.shouldNavigateToLogicView = true
                        }
                    }
                    withAnimation(.easeInOut(duration: 0.5)){
                        gateViewModel.mingoGatePosition = CGPoint(x: gateViewModel.mingoGatePosition.x, y: gateViewModel.mingoGatePosition.y - 200)
                    }
                    scoreManager.scoreLogic = 0
                    lessonViewModel.userLogicAnswerDrag = ""
                    lessonViewModel.userLogicAnswerFill = ""
                    lessonViewModel.userLogicAnswerChoice = ""
                }, text: "LOGICAL THINKING")
            }
        }
       
    }
    
    func designView() -> some View {
        NavigationLink(destination: gateViewModel.chooseDestinationDesign(), isActive: $gateViewModel.shouldNavigateToUIUXView ) {
            VStack {
                ZStack {
                    Image("progressBubble")
                    
                    Text("Score \(scoreManager.scoreDesign)")
                        .font(.custom("SFProRounded-Bold", size: 10))
                        .foregroundColor(.white)
                        .padding(.bottom,10)
                    
                }
                
                buildingButton(action: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        gateViewModel.selectedButton = "design"
                        withAnimation(.easeInOut(duration: 0.5)){
                            gateViewModel.mingoGatePosition = CGPoint(x: gateViewModel.mingoGatePosition.x + 120, y: gateViewModel.mingoGatePosition.y)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            gateViewModel.shouldNavigateToUIUXView = true
                        }
                    }
                    withAnimation(.easeInOut(duration: 0.5)){
                        gateViewModel.mingoGatePosition = CGPoint(x: gateViewModel.mingoGatePosition.x, y: gateViewModel.mingoGatePosition.y - 200)
                                              }
                    
                    scoreManager.scoreDesign = 0
                    lessonViewModel.userDesignAnswerChoice1 = ""
                    lessonViewModel.userDesignAnswerChoice2 = ""
                    lessonViewModel.userDesignAnswerChoice3 = ""
                }, text: "UI/UX DESIGN")
            }
        }
    
    }
    
    func programmingView() -> some View {
        NavigationLink(destination: gateViewModel.chooseDestinationProgramming(), isActive: $gateViewModel.shouldNavigateToProgrammingView) {
            VStack {
                ZStack {
                    Image("progressBubble")
                    
                    Text("Score \(scoreManager.scoreProgramming)")
                        .font(.custom("SFProRounded-Bold", size: 10))
                        .foregroundColor(.white)
                        .padding(.bottom,10)
                    
                }
                
                buildingButton(action: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        //                                     add this for animation
                        gateViewModel.selectedButton = "programming"
                        gateViewModel.shouldNavigateToProgrammingView = true
                    }
                    
                    withAnimation(.easeInOut(duration: 0.5)){
                        gateViewModel.mingoGatePosition = CGPoint(x: -120, y: 0)
                    }
                    scoreManager.scoreProgramming = 0
                    lessonViewModel.userAnswerDrag = ""
                    lessonViewModel.userAnswerFill = ""
                    lessonViewModel.userAnswerChoice = ""
                }, text: "PROGRAMMING")
            }
        }
      
    }
    
    func mathView() -> some View {
        NavigationLink(destination: gateViewModel.chooseDestinationMathematic(), isActive: $gateViewModel.shouldNavigateToMathematicsView) {
            VStack {
                ZStack {
                    Image("progressBubble")
                    
                    Text("Score \(scoreManager.scoreMath)")
                        .font(.custom("SFProRounded-Bold", size: 10))
                        .foregroundColor(.white)
                        .padding(.bottom,10)
                    
                }
                
                buildingButton(action: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        gateViewModel.selectedButton = "math"
                        gateViewModel.shouldNavigateToMathematicsView = true
                        print( gateViewModel.shouldNavigateToMathematicsView )
                    }
                    withAnimation(.easeInOut(duration: 0.5)){
                        gateViewModel.mingoGatePosition = CGPoint(x: 120, y: 0)
                    }
                    scoreManager.scoreMath = 0
                    lessonViewModel.userMathAnswerChoice1 = ""
                    lessonViewModel.userMathAnswerChoice2 = ""
                    lessonViewModel.userMathAnswerChoice3 = ""

                }, text: "MATHEMATICS")
            }
        }
    }
}
