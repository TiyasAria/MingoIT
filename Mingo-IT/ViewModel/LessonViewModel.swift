//
//  LessonViewModel.swift
//  Mingo-IT
//
//  Created by tiyas aria on 17/08/23.
//

import Foundation
import SwiftUI

class LessonViewModel : ObservableObject {
//     for generall all quiz
    
    @Published  var moveNextScreen  = false
    @Published var quizOnePassed: Bool = false
    @Published var quizTwoPassed: Bool = false
    @Published var quizThreePassed: Bool = false
    @StateObject var userScore : ScoreManager = ScoreManager()
    
//     for logic Quiz
    @AppStorage("progressValueLogic")  var progressValueLogic : Double  = 0.25
    @AppStorage("logicState")  var logicState = 0
    @AppStorage("userLogicAnswerChoice") var userLogicAnswerChoice = ""
    @AppStorage("userLogicAnswerFill") var userLogicAnswerFill = ""
    @AppStorage("userLogicAnswerDrag") var userLogicAnswerDrag = ""
 
    @ViewBuilder
    func chooseDestinationLogic() -> some View {
        if (logicState == 3) && (userScore.scoreLogic >= 2) {
            CompleteLessonScreen( materialType: .logic)
        } else {
            IncompleteLessonScreen(materialType: .logic)
        }
    }
    
//    FOR math lesson
    @AppStorage("progressValueMath")  var progressValueMath : Double  = 0.167
    @AppStorage("mathState")  var mathematicState = 0
    @AppStorage("userMathAnswerChoice1") var userMathAnswerChoice1 = ""
    @AppStorage("userMathAnswerChoice2") var userMathAnswerChoice2 = ""
    @AppStorage("userMathAnswerChoice3") var userMathAnswerChoice3 = ""
  
    @ViewBuilder
    func chooseDestinationMath() -> some View {
        if (mathematicState == 5) && (userScore.scoreMath >= 2) {
            CompleteLessonScreen( materialType: .mathematic)
        } else {
            IncompleteLessonScreen(materialType: .mathematic)
        }
    }
    
  
//    for Programming lesson
    @AppStorage("progressValue")  var progressValue : Double  = 0.25
    @AppStorage("programmingState")  var programmingState = 0
    @AppStorage("userAnswerDrag") var userAnswerDrag = ""
    @AppStorage("userAnswerFill") var userAnswerFill = ""
    @AppStorage("userAnswerChoice") var userAnswerChoice = ""

    @ViewBuilder
    func chooseDestinationProgramming() -> some View {
        if (programmingState == 3) && (userScore.scoreProgramming >= 2) {
            CompleteLessonScreen( materialType: .programming)
        } else {
            IncompleteLessonScreen(materialType: .programming)
        }
    }
    
//    for UI/UX lesson
    @AppStorage("progressDesign") var progressValueDesign : Double  = 0.125
    @AppStorage("designState") var designState = 0
    @AppStorage("userDesignAnswerChoice1") var userDesignAnswerChoice1 = ""
    @AppStorage("userDesignAnswerChoice2") var userDesignAnswerChoice2 = ""
    @AppStorage("userDesignAnswerChoice3") var userDesignAnswerChoice3 = ""
    

    @ViewBuilder
    func chooseDestinationUiUx() -> some View {
        if (designState == 7) && (userScore.scoreDesign >= 2) {
            CompleteLessonScreen( materialType: .design)
        } else {
            IncompleteLessonScreen(materialType: .design)
        }
    }
    
}
