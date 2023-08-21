//
//  ScoreManager.swift
//  Mingo-IT
//
//  Created by tiyas aria on 16/08/23.
//

import SwiftUI

class ScoreManager : ObservableObject {

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
