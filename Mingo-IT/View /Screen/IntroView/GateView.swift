//
//  GateView.swift
//  Mingo-IT
//
//  Created by Muhammad Abdul Ghani on 08/06/23.
//

import SwiftUI

struct GateView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject  var gateViewModel : GateViewModel
    @EnvironmentObject  var scoreManager : ScoreManager
    @EnvironmentObject  var lessonViewModel : LessonViewModel

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
                    closedGateImage(width: geometry.size.width)
                    
                    NavigationLink(destination: {
                        HomeScreen()
                    }, label: {
                        Image("back")
                            .padding(.leading, 20)
                        .padding(.top, 30)
                    })
                }
                
                VStack(spacing: 70) {
                    HStack(spacing: 100) {
                       logicalView()
                       designView()
                    }
                    
                    HStack(spacing: 100) {
                        programmingView()
                        mathView()
                    }
                }
                .padding(.bottom, 70)
             
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
                    .position(x: geometry.size.width/2 + gateViewModel.mingoGatePosition.x, y: geometry.size.height*2/2.9 + gateViewModel.mingoGatePosition.y)
                }
                
                if gateViewModel.showCoachMark {
                    CoachMark(isFinished: $gateViewModel.isFinished).opacity(gateViewModel.noCoachmark ? 0 : 1).animation(.easeInOut)
                }
                
            }
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .tabBar)    
        }
    }
}

struct GateView_Previews: PreviewProvider {
    static var previews: some View {
        GateView()
            .environmentObject(GateViewModel())
            .environmentObject(ScoreManager())
            .environmentObject(LessonViewModel())
    }
}
