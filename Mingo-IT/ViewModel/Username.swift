//
//  Username.swift
//  Mingo-IT
//
//  Created by tiyas aria on 07/06/23.
//

import SwiftUI


class UserManager  : ObservableObject {
//     authe user
    @AppStorage("user_signin") var currentUserSignIn : Bool = false
    @AppStorage("currentUser") var currentUsername : String?
// first launch
    @AppStorage("isFirstLaunchMath") var isFirstLaunchMath = true
    @AppStorage("isFirstLaunchDesign") var isFirstLaunchDesign = true
    @AppStorage("isFirstLaunchProgramming") var isFirstLaunchProgramming = true
    @AppStorage("isFirstLaunchLogic") var isFirstLaunchLogic = true

    
//     have you try answer the question
    @AppStorage("doneQuetion1") var isDoneQuestionOne : Bool = false
    @AppStorage("doneQuetion2") var isDoneQuestionTwo : Bool = false
    @AppStorage("doneQuetion3") var isDoneQuestionThree : Bool = false
  
}

class ScoreManager : ObservableObject {
//    score math
    @AppStorage("scoreMath") var scoreMath : Int = 0
        func updateScoreMath() {
            scoreMath += 1
        }
    
    @AppStorage("scoreDesign") var scoreDesign : Int = 0
        func updateScoreDesign() {
            scoreDesign += 1
        }
    
    @AppStorage("scoreProgramming") var scoreProgramming : Int = 0
        func updateScoreProgramming() {
            scoreProgramming += 1
        }
    
    @AppStorage("scoreLogic") var scoreLogic : Int = 0
        func updateScoreLogic() {
            scoreLogic += 1
        }
}
