//
//  GateViewModel.swift
//  Mingo-IT
//
//  Created by tiyas aria on 16/08/23.
//

import Foundation
import SwiftUI

class GateViewModel : ObservableObject {
    @Published  var isBuildingOpen = false
    @Published  var shouldNavigateToLogicView = false
    @Published  var shouldNavigateToUIUXView = false
    @Published  var shouldNavigateToProgrammingView = false
    @Published  var shouldNavigateToMathematicsView = false
    @Published  var showCoachMark = true
    @Published  var isFinished = false
    
    //     for animation
    @Published  var mingoGatePosition: CGPoint = .zero
    @Published  var selectedButton: String = ""
    

    @AppStorage("no_coachmark") var noCoachmark = false
    @ObservedObject var  userManager : UserManager = UserManager()
    @Published  var selectedTitle: String?
    
    @ViewBuilder
    func chooseDestinationProgramming() -> some View  {
        
        if userManager.isFirstLaunchProgramming {
            ExplanationLessonScreen(explanation: dataLesson[0])
        } else {
            ProgrammingView()
        }
        
    }
    
    @ViewBuilder
    func chooseDestinationLogic() -> some View  {
        
        if userManager.isFirstLaunchLogic {
            ExplanationLessonScreen(explanation: dataLesson[1])
        } else {
            LogicView()
        }
        
    }
    
    @ViewBuilder
    func chooseDestinationMathematic() -> some View  {
        
        if userManager.isFirstLaunchMath {
            ExplanationLessonScreen(explanation: dataLesson[2])
        } else {
            MathematicsView()
        }
        
    }
    
    @ViewBuilder
    func chooseDestinationDesign () -> some View  {
        
        if userManager.isFirstLaunchDesign {
            ExplanationLessonScreen(explanation: dataLesson[3])
        } else {
            UIUXView()
        }
        
    }
}
