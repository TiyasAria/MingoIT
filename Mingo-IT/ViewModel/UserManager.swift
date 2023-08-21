//
//  Username.swift
//  Mingo-IT
//
//  Created by tiyas aria on 07/06/23.
//

import SwiftUI


class UserManager  : ObservableObject {
//     authentication user
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
    
//     logic for signIn User
    private var scoreManager = ScoreManager()
    
    @Published var currentUser : String   = ""
    
    func signIn(){
        currentUsername = currentUser
        isFirstLaunchDesign = true
        isFirstLaunchProgramming = true
        isFirstLaunchMath = true
        isFirstLaunchLogic = true
        scoreManager.scoreDesign = 0
        scoreManager.scoreMath = 0
        scoreManager.scoreLogic = 0
        scoreManager.scoreProgramming = 0
    }
  
}


