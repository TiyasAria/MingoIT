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
    
    @AppStorage("no_coachmark") var no_coachmark = false
    
    var body: some View {
        
        NavigationView{
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
                        buildingButton(action: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                shouldNavigateToLogicView = true
                            }
                        }, text: "LOGICAL THINKING")
                        
                        buildingButton(action: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                shouldNavigateToUIUXView = true
                            }
                        }, text: "UI/UX DESIGN")
                    }
                    
                    HStack(spacing: 100) {
                        buildingButton(action: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                shouldNavigateToProgrammingView = true
                            }
                        }, text: "PROGRAMMING")
                        
                        buildingButton(action: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                shouldNavigateToMathematicsView = true
                            }
                        }, text: "MATHEMATICS")
                    }
                }
                .padding(.bottom, 100)
                .background(
                    NavigationLink(
                        destination: LogicView(),
                        isActive: $shouldNavigateToLogicView,
                        label: { EmptyView() }
                    )
                    .hidden()
                )
                .background(
                    NavigationLink(
                        destination: UIUXView(),
                        isActive: $shouldNavigateToUIUXView,
                        label: { EmptyView() }
                    )
                    .hidden()
                )
                .background(
                    NavigationLink(
                        destination: ProgrammingView(),
                        isActive: $shouldNavigateToProgrammingView,
                        label: { EmptyView() }
                    )
                    .hidden()
                )
                .background(
                    NavigationLink(
                        destination: MathematicsView(),
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
        }

    }
    
    private func buildingButton(action: @escaping () -> Void, text: String) -> some View {
        let buildingImage = Image("learningBuilding")
        
        return Button(action: action) {
            VStack {
                ZStack {
                    Image("progressBubble")
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 50, height: 5)
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
