//
//  GateView.swift
//  Mingo-IT
//
//  Created by Muhammad Abdul Ghani on 08/06/23.
//

import SwiftUI

struct GateView: View {
    @State private var isBuildingOpen = false
    @State private var shouldNavigateToLogicView = false
    @State private var shouldNavigateToUIUXView = false
    @State private var shouldNavigateToProgrammingView = false
    @State private var shouldNavigateToMathematicsView = false
    @State private var showCoachMark = true
    @State private var isFinished = false
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    @AppStorage("no_coachmark") var no_coachmark = false
    @StateObject private var userInteraction = UserManager()
    @State private var selectedTitle: String?
    @StateObject private var userScore = ScoreManager()
    
    @ViewBuilder
    func chooseDestinationProgramming() -> some View  {
        
        if userInteraction.isFirstLaunchProgramming {
            ExplanationLessonScreen(explanation: dataLesson[0])
        } else {
            ProgrammingView()
        }
        
    }
    
    @ViewBuilder
    func chooseDestinationLogic() -> some View  {
        
        if userInteraction.isFirstLaunchLogic {
            ExplanationLessonScreen(explanation: dataLesson[1])
        } else {
            LogicView()
        }
        
    }
    
    @ViewBuilder
    func chooseDestinationMathematic() -> some View  {
        
        if userInteraction.isFirstLaunchMath {
            ExplanationLessonScreen(explanation: dataLesson[2])
        } else {
            MathematicsView()
        }
        
    }
    
    @ViewBuilder
    func chooseDestinationDesign () -> some View  {
        
        if userInteraction.isFirstLaunchDesign {
            ExplanationLessonScreen(explanation: dataLesson[3])
        } else {
            UIUXView()
        }
        
    }
    var body: some View {
        
        NavigationStack{
            ZStack{
                Image("groundGate")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                GeometryReader { geometry in
                    Image("underbuildingGate")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width)
                }
                
                GeometryReader { geometry in
                    Image("stairsGate")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width)
                }
                
                GeometryReader { geometry in
                    if isBuildingOpen {
                        NavigationLink(destination: Level2View()){
                            openedGateImage(width: geometry.size.width)
                        }
                    } else {
                        closedGateImage(width: geometry.size.width)
                    }
                }
                
                VStack(spacing: 70) {
                    HStack(spacing: 100) {
                        VStack {
                            ZStack {
                                Image("progressBubble")
                                
                                Text("Score \(userScore.scoreLogic)")
                                    .font(.custom("SFProRounded-Bold", size: 10))
                                    .foregroundColor(.white)
                                    .padding(.bottom,10)
                                
                            }
                            
                            buildingButton(action: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    shouldNavigateToLogicView = true
                                }
                                userScore.scoreLogic = 0
                            }, text: "LOGICAL THINKING")
                        }
                        
                        VStack {
                            ZStack {
                                Image("progressBubble")
                                
                                Text("Score \(userScore.scoreDesign)")
                                    .font(.custom("SFProRounded-Bold", size: 10))
                                    .foregroundColor(.white)
                                    .padding(.bottom,10)
                                
                            }
                            
                            buildingButton(action: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    shouldNavigateToUIUXView = true
                                }
                                userScore.scoreDesign = 0
                            }, text: "UI/UX DESIGN")
                        }
                    }
                    
                    HStack(spacing: 100) {
                        VStack {
                            ZStack {
                                Image("progressBubble")
                                
                                Text("Score \(userScore.scoreProgramming)")
                                    .font(.custom("SFProRounded-Bold", size: 10))
                                    .foregroundColor(.white)
                                    .padding(.bottom,10)
                                
                            }
                            
                            buildingButton(action: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    shouldNavigateToProgrammingView = true
                                }
                                userScore.scoreProgramming = 0
                            }, text: "PROGRAMMING")
                        }
                        
                        VStack {
                            ZStack {
                                Image("progressBubble")
                                
                                Text("Score \(userScore.scoreMath)")
                                    .font(.custom("SFProRounded-Bold", size: 10))
                                    .foregroundColor(.white)
                                    .padding(.bottom,10)
                                
                            }
                            
                            buildingButton(action: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    shouldNavigateToMathematicsView = true
                                }
                                userScore.scoreMath = 0
                            }, text: "MATHEMATICS")
                        }
                    }
                }
                .padding(.bottom, 70)
                .background(
                    NavigationLink(
                        destination: chooseDestinationLogic(),
                        isActive: $shouldNavigateToLogicView,
                        label: { EmptyView() }
                    )
                    .hidden()
                )
                .background(
                    NavigationLink(
                        destination:  chooseDestinationDesign(),
                        isActive: $shouldNavigateToUIUXView,
                        label: { EmptyView() }
                    )
                    .hidden()
                )
                .background(
                    NavigationLink(
                        destination:  chooseDestinationProgramming(),
                        isActive: $shouldNavigateToProgrammingView,
                        label: { EmptyView() }
                    )
                    .hidden()
                )
                .background(
                    NavigationLink(
                        destination:  chooseDestinationMathematic(),
                        isActive: $shouldNavigateToMathematicsView,
                        label: { EmptyView() }
                    )
                    .hidden()
                )
                
                VStack(spacing: 180) {
                    HStack(spacing: 210) {
                        arrowView()
                        arrowView()
                    }
                    
                    HStack(spacing: 210) {
                        arrowView()
                        arrowView()
                    }
                }
                .padding(.top, 80)
                
                GeometryReader { geometry in
                    Image("MingoGate")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .position(x: geometry.size.width/2, y: geometry.size.height*2/2.9)
                }
                
                if showCoachMark {
                    CoachMark(isFinished: $isFinished).opacity(no_coachmark ? 0 : 1).animation(.easeInOut)
                }
                
            }
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .tabBar)
            .navigationBarItems(leading: Button(
                action : {
                    self.mode.wrappedValue.dismiss()
                }){
                    Image("back")
                })
            
        }
        
        
        
    }
    
    private func buildingButton(action: @escaping () -> Void, text: String) -> some View {
        let buildingImage = Image("learningBuilding")
        
        
        return Button(action: action) {
            VStack {
//                ZStack {
//                    Image("progressBubble")
//
//                    Text("Score \(userScore.scoreProgramming)")
//                        .font(.custom("SFProRounded-Bold", size: 10))
//                        .foregroundColor(.white)
//                        .padding(.bottom,10)
//
//                }
//
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
    
    private func arrowView() -> some View {
        let arrowImage = Image("arrow")
        
        return arrowImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 15)
            .edgesIgnoringSafeArea(.all)
    }
    
    private func openedGateImage(width: CGFloat) -> some View {
        Image("openedgateGate")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width)
            .padding(.top, 10)
    }
    
    private func closedGateImage(width: CGFloat) -> some View {
        Image("closedgateGate")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width)
            .padding(.top, 10)
    }
}




struct GateView_Previews: PreviewProvider {
    static var previews: some View {
        GateView()
    }
}
